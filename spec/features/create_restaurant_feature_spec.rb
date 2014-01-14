require 'spec_helper'

describe "Creating restaurants" do

  context "given a name and description" do

    it "should redirect to /restaurants and dispaly the restaurant" do
      visit new_restaurant_url
      expect :success # tests get request for the route
      fill_in 'Name', with: 'KFC'
      fill_in 'Description', with: 'Nuggests!'
      click_button 'Create Restaurant'
      expect(current_path).to eq(restaurants_path)
      expect(page).to have_content('Nuggests')
    end

  end # of context

end # of describe
