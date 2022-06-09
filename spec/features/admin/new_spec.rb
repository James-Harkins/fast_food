require "rails_helper"

describe "admin/new page" do
  describe "as a user who has bypassed the admin security check" do
    describe "when i visit the admin/new page" do
      before do
        admin = Admin.create!(name: "Bunk Moreland", email: "just_a_humble_muthafucka@bawlmur_po-lice.com", password: "password123", password_confirmation: "password123")
        visit "/admin/security_check"
        fill_in "Site password", with: "LocalAdminTestingPassword"
        click_button "Submit"
        click_button "Register As Admin"
      end

      it "i see a form to register, including name, email, and two password fields", :vcr do
        fill_in :name, with: "Lester Freamon"
        fill_in :email, with: "13_years_and_4_months@bawlmur_po-lice.com"
        fill_in :password, with: "test123"
        fill_in :password_confirmation, with: "test123"

        click_button "Register"

        expect(current_path).to eq("/admin/security_check")
        expect(page).to have_content("Admin successfully created. Please re-submit the Site Password and proceed to Admin Login.")
        fill_in "Site password", with: "LocalAdminTestingPassword"
        click_button "Submit"
        fill_in :email, with: "13_years_and_4_months@bawlmur_po-lice.com"
        fill_in :password, with: "test123"
        click_button "Login As Admin"

        expect(current_path).to eq("/admin/dashboard")
      end

      it "the form will not accept the input if i do not input a name" do
        fill_in :email, with: "13_years_and_4_months@bawlmur_po-lice.com"
        fill_in :password, with: "test123"
        fill_in :password_confirmation, with: "test123"

        click_button "Register"

        expect(current_path).to eq("/admin/new")
        expect(page).to have_content("Name can't be blank")
      end

      it "the form will not accept the input if i do not input an email" do
        fill_in :name, with: "Lester Freamon"
        fill_in :password, with: "test123"
        fill_in :password_confirmation, with: "test123"

        click_button "Register"

        expect(current_path).to eq("/admin/new")
        expect(page).to have_content("Email can't be blank")
      end

      it "the form will not accept an email that already exists in the database" do
        fill_in :name, with: "Lester Freamon"
        fill_in :email, with: "just_a_humble_muthafucka@bawlmur_po-lice.com"
        fill_in :password, with: "test123"
        fill_in :password_confirmation, with: "test123"

        click_button "Register"

        expect(current_path).to eq("/admin/new")
        expect(page).to have_content("Email has already been taken")
      end

      it "the form will not accept the submission if the user only submits a password without confirmation" do
        fill_in :name, with: "Lester Freamon"
        fill_in :email, with: "13_years_and_4_months@bawlmur_po-lice.com"
        fill_in :password, with: "test123"

        click_button "Register"

        expect(current_path).to eq("/admin/new")
        expect(page).to have_content("Password confirmation doesn't match Password")
      end

      it "the form will not accept the submission if the user only submits a password confirmation without an original" do
        fill_in :name, with: "Lester Freamon"
        fill_in :email, with: "13_years_and_4_months@bawlmur_po-lice.com"
        fill_in :password_confirmation, with: "test123"

        click_button "Register"

        expect(current_path).to eq("/admin/new")
        expect(page).to have_content("Password can't be blank")
      end

      it "the form will not accept the submission if the user inputs passwords that don't match" do
        fill_in :name, with: "Lester Freamon"
        fill_in :email, with: "13_years_and_4_months@bawlmur_po-lice.com"
        fill_in :password, with: "test123"
        fill_in :password_confirmation, with: "test125"

        click_button "Register"

        expect(current_path).to eq("/admin/new")
        expect(page).to have_content("Password confirmation doesn't match Password")
      end
    end
  end

  describe "as a user who has not bypassed the admin security check" do
    describe "when i visit the admin/new page" do
      it "i am redirected to the admin/security_check page and see an error" do
        visit "/admin/new"

        expect(current_path).to eq("/admin/security_check")
        expect(page).to have_content("You must input the site password in order to access the Admin Login page.")
      end
    end
  end
end
