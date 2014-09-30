require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  let(:line_item) { LineItem.create(order_id: 1, item_id: 1) }

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
