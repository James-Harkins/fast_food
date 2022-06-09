require "rails_helper"

describe "/admin/sessions/new page" do
  describe "as a user who has correctly bypassed the security check" do
    describe "when i visit the /admin/sessions/new_page after entering the correct site_password" do
      before do
        admin = Admin.create!(name: "Bunk Moreland", email: "just_a_humble_muthafucka@bawlmur_po-lice.com", password: "password123", password_confirmation: "password123")
        visit "/admin/security_check"
        fill_in "Site Password", with: ENV['SITE_PASSWORD']
        click_button "Submit"
      end

      it "i see a form to login, which redirects me to my admin dashboard", :vcr do
        fill_in :email, with: "just_a_humble_muthafucka@bawlmur_po-lice.com"
        fill_in :password, with: "password123"
        click_button "Login As Admin"

        expect(current_path).to eq("/admin/dashboard")
      end

      it "if i input credentials for an account that does not exist, i am redirected to the admin/login with an error" do
        fill_in :email, with: "what_the_fuck_did_i_do@bawlmur_po-lice.com"
        fill_in :password, with: "password123"
        click_button "Login As Admin"

        expect(current_path).to eq("/admin/login")
        expect(page).to have_content("There is no user on file with this email address.")
      end

      it "if i input incorect login credentials, i am redirected back to the form with an error message" do
        fill_in :email, with: "just_a_humble_muthafucka@bawlmur_po-lice.com"
        fill_in :password, with: "password12"
        click_button "Login As Admin"

        expect(current_path).to eq("/admin/login")
        expect(page).to have_content("Incorrect Credentials.")
      end

      it "i see a button to register as a new admin, which redirects me to the admin/new page" do
        click_button "Register As Admin"

        expect(current_path).to eq("/admin/new")
      end
    end
  end

  describe "as a visitor who has not completed the admin security check" do
    describe "when i attempt to visit the /admin/login page" do
      it "i am redirected to the admin/security check page" do
        visit "/admin/login"

        expect(current_path).to eq("/admin/security_check")
        expect(page).to have_content("You must input the site password in order to access the Admin Login page.")
      end
    end
  end
end
