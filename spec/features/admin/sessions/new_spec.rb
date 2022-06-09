require "rails_helper"

describe "/admin/sessions/new page" do
  describe "as a user" do
    describe "when i visit the /admin/sessions/new_page after entering the correct site_password" do
      before do
        admin = Admin.create!(name: "Bunk Moreland", email: "just_a_humble_muthafucka@bawlmur_po-lice.com", password: "password123", password_confirmation: "password123")
        visit "/admin/security_check"
        fill_in "Site password", with: "LocalAdminTestingPassword"
        click_button "Submit"
      end

      it "i see a form to login, which redirects me to my admin dashboard" do
        fill_in :email, with: "just_a_humble_muthafucka@bawlmur_po-lice.com"
        fill_in :password, with: "password123"
        click_button "Login"

        expect(current_path).to eq("/admin/dashboard")
      end

      it "if i input incorect login credentials, i am redirected back to the form with an error message" do
        fill_in :email, with: "just_a_humble_muthafucka@bawlmur_po-lice.com"
        fill_in :password, with: "password12"
        click_button "Login"

        expect(current_path).to eq("/admin/dashboard")
      end

      it "i see a button to register as a new admin, which redirects me to the admin/new page" do
        click_button "Register As Admin"

        expect(current_path).to eq("/admin/new")
      end
    end
  end
end
