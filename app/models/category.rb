class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :item_categories
  has_many :items, through: :item_categories

  def to_s
    name
  end

end
