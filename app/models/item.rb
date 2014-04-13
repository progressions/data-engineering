# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  purchaser_name   :string(255)
#  item_description :string(255)
#  item_price       :integer
#  purchase_count   :integer
#  merchant_address :string(255)
#  merchant_name    :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Item < ActiveRecord::Base
  def self.from_tsv(row)
    item_price = row[2].to_f * 100

    self.create(
      purchaser_name: row[0],
      item_description: row[1],
      item_price: item_price,
      purchase_count: row[3],
      merchant_address: row[4],
      merchant_name: row[5]
    )
  end

  def self.gross_revenue_for(item_ids)
  end
end
