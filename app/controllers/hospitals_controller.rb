class HospitalsController < ApplicationController

  before_action :set_hash
  expose(:hospital, attributes: :hospital_params)
  expose(:hospitals)
  expose(:doctors)

  def create
    redirect_to hospital if hospital.save
  end

  def update
    create
  end

  def destroy
    if hospital.destroy
      render :index
    end
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

  def hospital_params
    params.require(:hospital).permit!
  end
end
