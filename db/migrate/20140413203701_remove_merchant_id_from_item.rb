class RemoveMerchantIdFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :merchant_id, :string
  end
end
