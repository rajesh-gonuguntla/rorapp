class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :phone_number
      t.string :ship_to_first_name
      t.string :ship_to_last_name
      t.string :ship_to_address
      t.string :ship_to_country
      t.string :ship_to_state
      t.string :ship_to_city
      t.string :ship_to_zip

      t.timestamps
    end
  end
end
