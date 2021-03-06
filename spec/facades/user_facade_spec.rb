require "rails_helper"

describe UserFacade do
  describe "class methods" do
    describe "#get_all_users" do
      it "returns user POROs for all current users in the back-end", :vcr do
        users = UserFacade.get_all_users

        expect(users).to be_all User
        expect(users.count).to eq(7)
      end
    end
  end
end
