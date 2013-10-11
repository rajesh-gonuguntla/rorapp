class AddMemberIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :member_id, :integer
  end
end
