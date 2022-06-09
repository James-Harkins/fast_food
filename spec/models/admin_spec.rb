require "rails_helper"

describe Admin do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should have_secure_password }

    it "should not have a password attribute saved and the password_digest attribute should be a hash" do
      admin = Admin.create(name: "Jimmy McNulty", email: "what_the_fuck_did_i_do@bawlmur-po-lice.com", password: "password123", password_confirmation: "password123")
      expect(user).to_not have_attribute(:password)
      expect(user.password_digest).to_not eq("password123")
    end
  end
end
