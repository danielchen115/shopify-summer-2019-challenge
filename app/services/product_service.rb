module ProductService
  class << self
    def get_all_products(in_stock_only)
      if in_stock_only == "1"
        return Product.where.not(inventory_count: 0)
      end
      Product.all
    end

    def add_to_cart(product, user)
      cart = CartService.get_cart(user)
      product.add(cart)
    end
  end
end