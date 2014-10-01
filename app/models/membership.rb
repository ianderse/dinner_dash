class Membership < ActiveRecord::Base
	validates :role, presence: true
	has_many :users
end
