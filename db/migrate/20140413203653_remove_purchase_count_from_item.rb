class RemovePurchaseCountFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :purchase_count, :string
  end
end
