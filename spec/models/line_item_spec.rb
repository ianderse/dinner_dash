require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  let(:line_item) { LineItem.new() }

  before do
    line_item.order = Order.new(id: 1)
    line_item.item = Item.new(id: 1)
  end

  it "is valid" do
    expect(line_item).to be_valid
  end

  it 'is not valid without an order_id' do
    line_item.order_id = nil
    expect(line_item).to_not be_valid
  end

  it 'is not valid without an item_id' do
    line_item.item_id = nil
    expect(line_item).to_not be_valid
  end
end
