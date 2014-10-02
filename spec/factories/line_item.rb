FactoryGirl.define do
  factory :line_item do
    item  { build(:item) }
    order { build(:order) }
  end
end
