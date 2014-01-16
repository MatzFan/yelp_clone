require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ReviewsHelper do

  let(:review_5) { Review.new rating: 5 }
  let(:review_2) { Review.new rating: 2 }

  describe '.star_rating' do
    it 'should return 5 stars for a review rated 5' do
      expect(helper.star_rating(review_5)).to eq "\u2605" * 5
    end

    it 'should return 2 stars for a review rated 2' do
      expect(helper.star_rating(review_2)).to eq "\u2605" * 2 << "\u2606" * 3
    end

  end

end # of describe
