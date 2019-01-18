class Product < ApplicationRecord
  has_many :cart_products
  has_many :carts, through: :cart_products
  validates_presence_of :title, :price, :inventory_count
end
