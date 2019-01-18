module CartService
  class << self
    def get_cart(user)
      if user.carts.where(checkout_date: [nil, 'null']).any?
        return user.carts.where(checkout_date: [nil, 'null']).last
      end
      return user.carts.create!(total_amount: 0)
    end

    def add_to_cart(product, user, quantity)
      if quantity == nil
        quantity = 1
      end

      cart = get_cart(user)
      if cart.products.where(id: product.id).any?
        cart_product = cart.cart_products.where(product_id: product.id).first
        cart_product.increment(:quantity, quantity)
        cart_product.save
      else
        CartProduct.create(cart: cart, product: product, quantity: quantity)
      end
      cart.increment(:total_amount, (quantity * product.price.to_d))
      cart.save
      return cart
    end

    def remove_from_cart(product, user, quantity)
      if quantity == nil
        quantity = 1
      end

      cart = get_cart(user)
      if cart.products.where(id: product.id).any?
        cart_product = cart.cart_products.where(product_id: product.id).first
        if quantity > cart_product.quantity.to_i
          quantity = cart_product.quantity.to_i
        end
        cart.decrement(:total_amount, (quantity * product.price.to_d))
        cart.save
        cart_product.decrement(:quantity, quantity)
        if cart_product.quantity.to_i == 0
          cart_product.destroy
        else
          cart_product.save
        end
      end
      return cart
    end

    def checkout(user)
      cart = get_cart(user)
      if not cart.products.any?
          return 'There are no products in your cart.'
      end
      invalid_products = []
      for product in cart.products
        if product.inventory_count.to_i < cart.cart_products.where(product_id: product.id).first.quantity.to_i
          invalid_products << product.title
        end
      end
      if invalid_products.any?
        return 'The following products do not have enough stock to complete your request: ' + invalid_products.join(", ")
      end

      cart.checkout_date = DateTime.now
      cart.save
      return 'Checkout successful.'
    end
  end
end