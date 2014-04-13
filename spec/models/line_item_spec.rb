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

require 'spec_helper'

describe LineItem do
  pending "add some examples to (or delete) #{__FILE__}"
end
