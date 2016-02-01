class DoctorsController < ApplicationController
  expose(:hospital)
  expose(:doctor)
  expose(:doctors)

  def create
    redirect_to doctor if doctor.save
  end

  def update
    create
  end

  def destroy
    if doctor.destroy
      render :index
    end
  end

  private


end
