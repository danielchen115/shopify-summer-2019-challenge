class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.decimal :total_amount, :default => 0
      t.datetime :checkout_date

      t.timestamps
    end
  end
end
