class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.boolean :admin
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :password_digest

      t.timestamps
    end
  end
end
