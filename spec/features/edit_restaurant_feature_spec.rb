require 'spec_helper'

describe "Editing restaurants" do

  let(:restaurant) { Restaurant.create({ name: 'KFC', description: 'Nugget' }) }

  context "given an exiting restaurant" do

    it "should update the relevant parameter" do
      visit edit_restaurant_path(restaurant)
      fill_in 'Name', with: 'Burger King'
      click_button 'Update Restaurant'
      expect(current_path).to eq(restaurants_path)
      expect(page).to have_content('Burger King')
    end

  end # of context

end # of de
