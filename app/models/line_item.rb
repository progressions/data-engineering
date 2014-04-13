# == Schema Information
#
# Table name: line_items
#
#  id             :integer          not null, primary key
#  item_id        :integer
#  purchaser_id   :integer
#  merchant_id    :integer
#  purchase_count :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :merchant
  belongs_to :purchaser

  def gross_revenue
    item.price.to_i * purchase_count.to_i
  end
end
