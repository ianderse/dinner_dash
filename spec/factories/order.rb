FactoryGirl.define do
  factory :order do
    status "pending"
    exchange "pickup"
    street_number "123"
    street "Sesame St"
    city "Wall"
    state "GN"
    zip "80120"
  end
end
