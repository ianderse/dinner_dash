class Membership < ActiveRecord::Base
	validates :role, default: "user", presence: true
	has_many :users
end
