require "rails_helper"

describe "admin dashboard page" do
  describe "as a logged-in admin" do
    describe "when i visit the admin dashboard page" do
      before do
        admin = Admin.create!(name: "Bunk Moreland", email: "just_a_humble_muthafucka@bawlmur_po-lice.com", password: "password123", password_confirmation: "password123")
        visit "/admin/security_check"
      
        fill_in "Site Password", with: ENV['SITE_PASSWORD']
        click_button "Submit"
        fill_in :email, with: "just_a_humble_muthafucka@bawlmur_po-lice.com"
        fill_in :password, with: "password123"
        click_button "Login As Admin"
      end

      it "i see a list of all the users saved in the back-end with their emails and with buttons to delete them", :vcr do
        user_data = {
          name: "deletion test2",
          email: "deletion2@test.com"
        }

        UserService.create_user(user_data)

        visit "/admin/dashboard"

        expect(page).to have_content("Current Users:")

        within "#user-1" do
          expect(page).to have_content("Frank")
          expect(page).to have_content("frankhdafgfad@g.com")
          expect(page).to have_button("Delete This User")
        end

        within "#user-3" do
          expect(page).to have_content("nate")
          expect(page).to have_content("nate@g.com")
          expect(page).to have_button("Delete This User")
        end

        within "#user-7" do
          expect(page).to have_content("Example User")
          expect(page).to have_content("example@example.com")
          expect(page).to have_button("Delete This User")
        end

        within "#user-9" do
          expect(page).to have_content("deletion test2")
          expect(page).to have_content("deletion2@test.com")
          click_button("Delete This User")
        end

        expect(current_path).to eq("/admin/dashboard")
        expect(page).not_to have_content("deletion test2")
        expect(page).not_to have_content("deletion2@test.com")
      end
    end
  end

  describe "as a visitor admin" do
    describe "when i attempt to visit the admin dashboard page" do
      it "i am redirected to the admin/security_check page and see an error" do
        visit "/admin/dashboard"

        expect(current_path).to eq("/admin/security_check")
        expect(page).to have_content("You must input the site password in order to access the Admin Login page.")
      end
    end
  end
end
