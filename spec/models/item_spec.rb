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

require 'spec_helper'

describe Item do
  pending "add some examples to (or delete) #{__FILE__}"
end
