class CreateCartsProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :carts_products do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :product, index: true
      t.integer :quantity, :default => 0
    end
  end
end
