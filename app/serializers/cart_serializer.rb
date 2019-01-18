class CartSerializer < ActiveModel::Serializer
  attributes :id, :total_amount, :created_at, :updated_at, :checkout_date, :products

  def products
    self.object.products.map do |product|
      {
          id: product.id,
          title: product.title,
          price: product.title,
          quantity: CartProduct.where(cart_id: self.object.id, product_id: product.id).first.quantity
      }
    end
  end
end
