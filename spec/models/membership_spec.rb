require 'rails_helper'

RSpec.describe Membership, :type => :model do
	let(:user) do
    User.create(
      first_name: "Jane",
      last_name: "Doughey",
      email: "abc1234@example.com",
      nickname: "janedoughburger5",
      password: "abcdefg",
      password_confirmation: "abcdefg"
    )
  end

  let(:membership) do
  	Membership.create(user_id: user.id)
  end

  it "is valid without a role" do
  	expect(membership).to be_valid
  end
end
