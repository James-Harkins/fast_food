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
      it "returns data for all users from the back-end", :vcr do
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

    describe "#delete_user" do
      it "sends a delete request to the back-end to destroy a user", :vcr do
        user_data = {
          name: "deletion test1",
          email: "deletion1@test.com"
        }

        UserService.create_user(user_data)

        first_response = UserService.find_by_email(user_data[:email])
        expect(first_response).to be_a Hash
        expect(first_response[:data]).to be_a Hash
        expect(first_response[:data][:id]).to be_a String
        expect(first_response[:data][:attributes][:name]).to eq(user_data[:name])
        expect(first_response[:data][:attributes][:email]).to eq(user_data[:email])

        UserService.delete_user("deletion1@test.com")

        second_response = UserService.find_by_email(user_data[:email])

        expect(second_response[:data]).to eq(nil)
      end
    end
  end
end
