class Review < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  # ensure one review per user-restaurant
  validates_uniqueness_of :restaurant_id, scope: :user_id
end
