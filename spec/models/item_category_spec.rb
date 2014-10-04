RSpec.describe ItemCategory, :type => :model do
  let(:item_category) { create(:item_category) }

  it "is valid" do
    expect(item_category).to be_valid
  end

  it 'is not valid without an order' do
    item_category.category = nil
    expect(item_category).to_not be_valid
  end

  it 'is not valid without an item' do
    item_category.item = nil
    expect(item_category).to_not be_valid
  end
end
