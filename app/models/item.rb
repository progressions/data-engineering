# == Schema Information
#
# Table name: items
#
#  id               :integer          not null, primary key
#  item_description :string(255)
#  item_price       :integer
#  purchase_count   :integer
#  created_at       :datetime
#  updated_at       :datetime
#  purchaser_id     :integer
#  merchant_id      :integer
#

class Item < ActiveRecord::Base
  def gross_revenue
    item_price.to_i * purchase_count.to_i
  end
end
