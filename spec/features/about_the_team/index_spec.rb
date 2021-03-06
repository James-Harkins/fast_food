require "rails_helper"

RSpec.describe "About The Team Page" do
  describe "As a Visitor" do

    it 'Has information about the team' do

      visit '/about_the_team'
    
      expect(page).to have_content("About the Team")
      expect(page).to have_link("Front End Repositoy")
      expect(page).to have_link("Back End Repositoy")
      
      within '#alex' do
        expect(page).to have_content("Alex Randolph")
        expect(page).to have_link("GitHub")
        expect(page).to have_link("LinkedIn")
      end


      within '#james' do
        expect(page).to have_content("James Harkins")
        expect(page).to have_link("GitHub")
        expect(page).to have_link("LinkedIn")
      end

      within '#katy' do
        expect(page).to have_content("Katy Harrod")
        expect(page).to have_link("GitHub")
        expect(page).to have_link("LinkedIn")
      end

      within '#luke' do
        expect(page).to have_content("Luke Pascale")
        expect(page).to have_link("GitHub")
        expect(page).to have_link("LinkedIn")
      end

      within '#reuben' do
        expect(page).to have_content("Reuben Davison")
        expect(page).to have_link("GitHub")
        expect(page).to have_link("LinkedIn")
      end
    end 

    it 'Footer link for about the team takes to about the team page' do
      visit '/'
      click_link "About the Team"

      expect(current_path).to eq("/about_the_team")


    end 



  end 
end 