class Product < ApplicationRecord
  has_and_belongs_to_many :carts
  validates_presence_of :title, :price, :inventory_count
end
