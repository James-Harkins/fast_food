require 'rails_helper'

RSpec.describe "Recipe Results Index Page" do

  describe "As a Visitor" do

    it 'If I visit /recipes without having searched for a recipe first, I am redirected to /recipes/search' do
      visit '/recipes'

      expect(page).to have_content("Please Enter a Search Parameter")
    end



  end 
end 