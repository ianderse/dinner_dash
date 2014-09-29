class Category < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :categories
  has_many :items, through: :categories

  def to_s
    name
  end
end
