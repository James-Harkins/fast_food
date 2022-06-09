require "rails_helper"

describe UserService do
  describe "class methods" do
    describe "#create_user" do
      it "sends a post request to the back-end to create a user", :vcr do
        user_data = {
          name: "Kaepora Music",
          email: "kaepora.co@gmail.com"
        }
        response = UserService.create_user(user_data)

        expect(response).to be_a(Faraday::Response)
      end
    end

    describe "#find_by_email" do
      it "returns a user from the back-end", :vcr do
        email = "kaepora.co@gmail.com"

        user = UserService.find_by_email(email)

        expect(user).to be_a Hash
        expect(user[:data]).to be_a Hash
        expect(user[:data][:id]).to be_a String
        expect(user[:data][:attributes][:name]).to eq("Kaepora Music")
        expect(user[:data][:attributes][:email]).to eq(email)
      end
    end

    describe "#get_all_users" do
      it "returns data for all users from the back-end" do
        users = UserService.get_all_users

        expect(users).to be_a Hash
        expect(users[:data]).to be_an Array
        expect(users[:data].count).to eq(7)
        expect(users[:data][0]).to be_a Hash
        expect(users[:data][0][:id]).to eq("1")
        expect(users[:data][0][:type]).to eq("user")
        expect(users[:data][0][:attributes]).to be_a Hash
        expect(users[:data][0][:attributes][:name]).to eq("Frank")
        expect(users[:data][0][:attributes][:email]).to eq("frankhdafgfad@g.com")
      end
    end
  end
end
