class Hospital < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  geocoded_by :full_address
  after_validation :geocode
  has_many :doctors


  private

  def full_address
    "#{address}, #{city}"
  end

end
