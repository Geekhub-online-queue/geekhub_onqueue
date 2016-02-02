class DoctorsController < HospitalsController
  
  def create
    doctor.save
  end

  def update
    create
  end

  def destroy
    doctor.destroy
  end

end
