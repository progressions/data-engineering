# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    purchaser_name "MyString"
    item_description "MyString"
    item_price 1
    purchase_count 1
    merchant_address "MyString"
    merchant_name "MyString"
  end
end
