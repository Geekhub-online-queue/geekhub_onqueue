class HospitalsController < ApplicationController

  before_action :set_hash
  expose(:hospital)
  expose(:hospitals)
  expose(:doctor)
  expose(:doctors)
  expose(:records)
  expose(:specialization)
  expose(:specializations)

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
      # hospital_path = view_context.link_to hos.title, hospital_path(hos)
      # marker.infowindow "<b>#{hospital_path}</b>"
      marker.infowindow render_to_string(:partial => "/hospitals/infowindow", :locals => { :object => hos})
    end
  end
  helper_method :set_hash
end
