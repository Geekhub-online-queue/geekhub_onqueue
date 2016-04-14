class RecordsController < DoctorsController
  before_filter :authenticate_user!
  expose(:record, attributes: :record_params)

  def create
    if record.save
      record.update_attributes(doctor_id: doctor.id, name: current_user.username, phone: current_user.phone)
      redirect_to(hospital_doctor_path(hospital.id, doctor.id))
    else
      render :new
    end
  end

  def update
    create
  end

  def destroy
    record.destroy
  end

  private

  def record_params
    params.require(:record).permit!
  end
end
