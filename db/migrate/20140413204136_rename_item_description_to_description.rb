class RenameItemDescriptionToDescription < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.rename :item_description, :description
      t.rename :item_price, :price
    end
  end
end
