require 'rails_helper'

RSpec.describe Item, :type => :model do
  let(:item) { Item.new(title:"Item One", description:"It's an item", price:44.95)}
  let(:category){ {title: "Vegan"} }

  before do
    item.categories.build(category)
  end

  it 'is valid' do
  	expect(item).to be_valid
  end

  it 'is invalid without a title' do
  	item.title = nil
  	expect(item).to_not be_valid
  end

  it 'is invalid without a description' do
  	item.description = nil
  	expect(item).to_not be_valid
  end

  it 'is invalid if price is equal to zero' do
  	item.price = 0.0
  	expect(item).to_not be_valid
  end

  it 'is invalid if price is less than zero' do
  	item.price = -5
  	expect(item).to_not be_valid
  end

  it 'is invalid if price is not numeric' do
  	item.price = "asdf"
  	expect(item).to_not be_valid
  end

  it 'is invalid without category' do
    item.categories = []
    expect(item).to_not be_valid
  end

  it 'uses a default image if one is not uploaded' do
  	skip
  end
end
