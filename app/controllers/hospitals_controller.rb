class HospitalsController < ApplicationController
  expose(:hospital, attributes: :hospital_params)
  expose(:hospitals)

  def create
    if hospital.save
      redirect_to hospital
    else
      render :new
    end
  end

  def update
    if hospital.save
      redirect_to hospital
    end
  end

  def destroy
    if hospital.destroy
      render :index
    end
  end

  private

  def hospital_params
    params.require(:hospital).permit(:title, :phone)
  end
end
