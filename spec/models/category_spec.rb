require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:category) { Category.new(title:"vegan", description:"It's gross")}

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'is invalid without a title' do
    category.title = nil
    expect(category).to_not be_valid
  end

  it 'is invalid without a description' do
      category.description = nil
    expect(category).to_not be_valid
  end


end
