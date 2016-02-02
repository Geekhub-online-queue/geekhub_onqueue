class HospitalsController < ApplicationController
  before_action :set_hash
  expose(:hospital)
  expose(:hospitals)
  expose(:doctor)
  expose(:doctors)

  def create
    hospital.save
  end

  def update
    create
  end

  def destroy
    hospital.destroy
  end

  private

  def set_hash
    @hospitals = Hospital.all
    @hash = Gmaps4rails.build_markers(@hospitals) do |hos, marker|
      marker.lat hos.latitude
      marker.lng hos.longitude
    end
  end
  helper_method :set_hash
end
