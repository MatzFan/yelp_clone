module ReviewsHelper

  def rating_range
    (1..5).to_a
  end

  def star_rating(review)
    rating = review.rating
    ('★' * rating) << ('☆' * (5 - rating))
  end

end
