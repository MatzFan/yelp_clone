require 'spec_helper'

describe "Creating reviews" do

  before(:each) do
    # create a restaurant record
    @restaurant = Restaurant.create(name: 'KFC', description: 'Nugget')
  end

  context "given a restaurant and review content" do

    it "should redirect to /restaurants/<id>/review and display the review" do
      visit restaurant_url(@restaurant)
      expect :success # tests get request for the route
      click_link 'Create Review'
      expect(current_path).to eq(new_restaurant_review_path(@restaurant))
      fill_in 'Content', with: 'Food was great'
      # click_button 'Create Restaurant'
      # expect(current_path).to eq(restaurants_path)
      # expect(page).to have_content('Nuggests')
    end

  end # of context

end # of desc
