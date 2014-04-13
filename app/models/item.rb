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
end
