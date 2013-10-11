class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.float :price
      t.integer :quantity
      t.references :products
      t.references :orders

      t.timestamps
    end
    add_index :order_items, :products_id
    add_index :order_items, :orders_id
  end
end
