class RemovePurchaserNameFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :purchaser_name, :string
  end
end
