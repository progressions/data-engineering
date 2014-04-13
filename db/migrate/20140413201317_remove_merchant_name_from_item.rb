class RemoveMerchantNameFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :merchant_name, :string
  end
end
