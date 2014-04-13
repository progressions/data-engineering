class RemovePurchaserIdFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :purchaser_id, :string
  end
end
