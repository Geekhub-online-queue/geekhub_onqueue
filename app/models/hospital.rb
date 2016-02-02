class Hospital < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode
  has_many :doctors

  def full_address
    "#{address}, #{city}"
  end
end
