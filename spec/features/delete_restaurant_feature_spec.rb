require 'spec_helper'

describe "Deleting restaurants" do


before(:each) do
  restaurant = Restaurant.create({ name: 'KFC', description: 'Nugget' })
end

  context "given an exiting restaurant" do

    it "should redirect to /restaurants and delete the restaurant" do
      visit restaurants_url
      click_link('Destroy')
      expect(current_path).to eq(restaurants_path)
      expect(page).not_to have_content('KFC')
    end

  end # of context

end # of describe
