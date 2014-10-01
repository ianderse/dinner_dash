FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Snow"
    nickname "knownothing"
    email "winteriscoming@example.com"
    password "123"
    password_confirmation "123"
  end
end
