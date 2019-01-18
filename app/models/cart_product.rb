class CartProduct < ApplicationRecord
  self.table_name = 'carts_products'
  belongs_to :cart
  belongs_to :product
end
