FactoryGirl.define do
  factory :item_category do
    item { build(:item) } 
    category { build(:category) } 
  end
end
