class User < ActiveRecord::Base
  validates_presence_of :email, :username, :number_card, :date_of_birth, :phone, :password, :password_confirmation, :current_password, :message => "Дані не можуть бути пустими"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_attached_file :photo,
    :default_url => ActionController::Base.helpers.asset_path('users/missing.png'),
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {:path => proc { |style| "users/#{id}/#{style}/#{photo.original_filename}" }}

  #has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
