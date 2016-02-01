class Hospital < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :doctors
end
