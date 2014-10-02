FactoryGirl.define do
  factory :order do
    association :user
    items { [build(:item)] }
    status "paid"
    exchange "pickup"
    street_number "123"
    street "Sesame St"
    city "Wall"
    state "GU"
    zip "80120"
  end
end
