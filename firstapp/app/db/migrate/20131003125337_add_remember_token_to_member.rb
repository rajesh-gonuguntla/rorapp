class AddRememberTokenToMember < ActiveRecord::Migration
  def change
    add_column :members, :remember_token, :string
  end
end
