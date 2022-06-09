require "rails_helper"

describe "admin/security_check page" do
  describe "as a user" do
    describe "when i visit the admin/security_check page" do
      it "i see a form to submit the site password in order to proceed to login" do
        visit "/admin/security_check"

        expect(page).to have_content("Enter the Site Password to Proceed to Admin Login:")

        fill_in "Site password", with: "LocalAdminTestingPassword"
        click_button "Submit"

        expect(current_path).to eq("/admin/login")
      end

      it "i see a form to submit the site password in order to proceed to login" do
        visit "/admin/security_check"

        expect(page).to have_content("Enter the Site Password to Proceed to Admin Login:")

        fill_in "Site password", with: "NotTheRightPassword"
        click_button "Submit"

        expect(current_path).to eq("/admin/security_check")
        expect(page).to have_content("Incorrect Password.")
      end
    end
  end
end
