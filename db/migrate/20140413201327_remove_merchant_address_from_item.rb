class RemoveMerchantAddressFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :merchant_address, :string
  end
end
