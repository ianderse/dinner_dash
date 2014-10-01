require 'rails_helper'

RSpec.describe Order, :type => :model do
  let(:category)              { Category.create!(title: "Vegan") }
  let(:valid_item_attributes) { { title: 'carrots', description: 'orange', price: '10.00', categories: [category] } }
  let(:valid_user_attributes) { { first_name: "John", last_name: "Snow", email: "jon@example.com", nickname: "wolfie"} }
  let(:user)                  { User.create(valid_user_attributes) }
  let(:item)                  { Item.create(valid_item_attributes) }
  # let(:order)                 { create.:order }
  let(:order)                 { Order.create(items: [item], exchange: "pickup", user: user, status: "completed") }

  it "is valid when it has items" do
    expect(order).to be_valid
  end

  it "is invalid while it does not have items" do
    order.items = []
    expect(order).to_not be_valid
  end

  it "is invalid without a user" do
    order.user = nil
    expect(order).to_not be_valid
  end

  it "has an exchange of either pickup or delivery" do
    order.exchange = "neither"
    expect(order).to be_invalid
  end

  it 'is invalid without a correct status' do
    order.status = nil
    expect(order).to_not be_valid
    order.status = 'neither'
    expect(order).to_not be_valid
    order.status = 'cancelled'
    expect(order).to be_valid
    order.status = 'completed'
    expect(order).to be_valid
    order.status = 'paid'
    expect(order).to be_valid
  end

  context "when the exchange is a delivery" do
    it 'is invalid unless all address fields are present' do
      order.exchange = 'delivery'
      expect(order).to_not be_valid
      order.street_number = '123'
      expect(order).to_not be_valid
      order.street = 'abc'
      expect(order).to_not be_valid
      order.city = 'city'
      expect(order).to_not be_valid
      order.state = 'OK'
      expect(order).to_not be_valid
      order.zip = '4567'
      expect(order).to be_valid
    end
  end
end
