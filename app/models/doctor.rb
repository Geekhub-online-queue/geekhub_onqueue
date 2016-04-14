class Doctor < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :specialization
  has_many :records

  has_attached_file :photo,
    # :default_url => ActionController::Base.helpers.asset_path('doctors/missing.png'),
    :default_url => "doctor_default.png",
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {:path => proc { |style| "doctors/#{id}/#{style}/#{photo.original_filename}" }}

  #has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
