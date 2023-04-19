require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create!(
      email: "jiamin@email.com",
      password: "mypassword"
    )
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "is_password?" do
    it "Return true if password is correct" do
      expect(user.is_password?("mypassword")).to be true
    end
    
    it "Return false if password is not correct" do
      expect(user.is_password?("fakepassword")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "replace session token with new one for user" do
      old_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_token)
    end

    it "Return the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before {user.save!}

    it "Return the user if given correct and existing username & password" do
      expect(User.find_by_credentials("jiamin@email.com", "mypassword")).to eq(user)
    end

    it "Return nil if given invalid username or password" do
      expect(User.find_by_credentials("jiamin@email.com", "fakepassword")).to eq(nil)
    end
  end


end
