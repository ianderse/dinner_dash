# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order_item do
    product_id 1
    order_id 1
    quantity 1
  end
end
