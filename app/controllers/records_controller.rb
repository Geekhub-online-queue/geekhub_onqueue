class RecordsController < DoctorsController
    expose(:record, attributes: :record_params)

  def create
    if record.save
      record.update_attribute(:doctor_id, doctor.id)
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
