require 'rails_helper'

RSpec.describe LineItem, :type => :model do
  let(:line_item) { create(:line_item) }

  it "is valid" do
    expect(line_item).to be_valid
  end

  it 'is not valid without an order' do
    line_item.order = nil
    expect(line_item).to_not be_valid
  end

  it 'is not valid without an item' do
    line_item.item = nil
    expect(line_item).to_not be_valid
  end
end
