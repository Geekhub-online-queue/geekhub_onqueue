class Hospital < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  geocoded_by :full_address
  after_validation :geocode
  has_many :doctors

  has_attached_file :photo,
    # :default_url => ActionController::Base.helpers.asset_path('hospitals/missing.png'),
    :default_url => "hospital_default.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {:path => proc { |style| "hospitals/#{id}/#{style}/#{photo.original_filename}" }}

  #has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def normalize_friendly_id(text)
    text.to_slug.normalize(transliterations: :russian).to_s
  end

  private

  def full_address
    "#{address}, #{city}"
  end

end
