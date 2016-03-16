class Record < ActiveRecord::Base
  belongs_to :doctor

  validates :data, uniqueness: { scope: :doctor }, presence: true # TODO. fix this validation
  validates :name, presence: true
  validates :phone, presence: true
end
