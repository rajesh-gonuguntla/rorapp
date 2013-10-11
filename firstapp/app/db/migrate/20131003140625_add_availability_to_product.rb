class AddAvailabilityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :availability, :integer
  end
end
