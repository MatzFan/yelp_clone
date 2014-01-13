require 'spec_helper'

describe "Creating restaurants" do

  context "given a name and description" do

    it "should redirect to /restaurants and display the restaurant" do
      visit '/restaurants/new'
      expect :success # tests get request for the route
      fill_in 'Name', with: 'KFC'
      fill_in 'Description', with: 'Nuggets!'
      click_button 'Create Restaurant'
      expect(current_path).to eq('/restaurants')
      expect(page).to have_content('Nuggets')
    end

  end # of context

end # of describe
