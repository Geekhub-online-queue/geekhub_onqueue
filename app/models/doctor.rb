class Doctor < ActiveRecord::Base
  belongs_to :hospital
  has_many :records
end
