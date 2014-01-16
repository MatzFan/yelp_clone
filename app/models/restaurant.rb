class Restaurant < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :geocode
  after_validation :geocode

end
