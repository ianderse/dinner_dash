class User < ActiveRecord::Base
  belongs_to :membership

  has_many :orders
  has_secure_password

  validate :first_and_last_names_cannot_both_be_blank
  validates :nickname, length: { in: 2..32, allow_nil: true }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  def first_and_last_names_cannot_both_be_blank
    if first_name.empty? && last_name.empty?
      errors.add(:full_name, "can't be blank")
    end
  end

  def full_name
    "#{first_name + " " + last_name}".strip
  end
end
