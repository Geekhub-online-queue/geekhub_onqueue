class SpecializationsController < ApplicationController

  def create
    specialization.save
  end

  def update
    create
  end

  def destroy
    specialization.destroy
  end

end
