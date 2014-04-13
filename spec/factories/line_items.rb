# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    item_id 1
    purchaser_id 1
    merchant_id 1
    purchase_count 1
  end
end
