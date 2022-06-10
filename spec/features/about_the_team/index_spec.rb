require "rails_helper"

RSpec.describe "About The Team Page" do
  describe "As a Visitor" do

    it 'Has information about the team' do

      visit '/about_the_team'

      expect(page).to have_content("About the Team")
      expect(page).to have_content("Front End Repositoy: https://github.com/James-Harkins/fast_food")
      expect(page).to have_content("Back End Repositoy: https://github.com/mcharrod/fast_food_backend")
      
      within '#alex' do
        expect(page).to have_content("Alex Randolph")
        expect(page).to have_content("GitHub: https://github.com/alexGrandolph")
        expect(page).to have_content("LinkedIn: https://www.linkedin.com/in/alexgrandolph/")
      end


      within '#james' do
        expect(page).to have_content("James Harkins")
        expect(page).to have_content("GitHub: https://github.com/James-Harkins")
        expect(page).to have_content("LinkedIn: https://www.linkedin.com/in/james-harkins-co/")
      end

      within '#katy' do
        expect(page).to have_content("Katy Harrod")
        expect(page).to have_content("GitHub: https://github.com/mcharrod")
        expect(page).to have_content("LinkedIn: https://www.linkedin.com/in/katyharrod/")
      end

      within '#luke' do
        expect(page).to have_content("Luke Pascale")
        expect(page).to have_content("GitHub: https://github.com/enalihai")
        expect(page).to have_content("LinkedIn: https://www.linkedin.com/in/luke-pascale/")
      end

      within '#reuben' do
        expect(page).to have_content("Reuben Davidson")
        expect(page).to have_content("GitHub: https://github.com/Reuben-Davison")
        expect(page).to have_content("LinkedIn: https://www.linkedin.com/in/reuben-davison-3b9ab7227/")
      end






    end 





  end 
end 