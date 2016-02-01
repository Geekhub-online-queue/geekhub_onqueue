class HospitalsController < ApplicationController
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

  def hospital_params
    params.require(:hospital).permit!
  end
end
