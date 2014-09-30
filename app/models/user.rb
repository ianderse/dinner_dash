class User < ActiveRecord::Base
  has_many :orders
  validates :first_name, :last_name, presence: true
  validates :nickname, length: {in: 2..32}                    
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
end
