RSpec.describe User, :type => :model do
  let(:user) do
    User.create(
      first_name: "Jane",
      last_name: "Doughey",
      email: "abc1234@example.com",
      nickname: "janedoughburger5"
    )
  end

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a first_name" do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it "is invalid without a last_name" do
    user.last_name = nil
    expect(user).to_not be_valid
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "has a valid email" do
    user.email = "abc,example.com"
    expect(user).to_not be_valid

    user.email = "someone@asd"
    expect(user).to_not be_valid

    user.email = "abc1@example.com"
    expect(user).to be_valid
  end

  it "has a unique email" do
    second_user = user.dup
    second_user.save
    expect(second_user).to_not be_valid
  end

  # it "has an optional nickname between 2 - 32 characters" do
  #
  # end
  #
  # it "has a fullname" do
  # end
end
