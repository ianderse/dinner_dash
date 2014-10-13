class Review < ActiveRecord::Base
	validates :title, :body, :stars, presence: true
  belongs_to :item
  belongs_to :user
end
