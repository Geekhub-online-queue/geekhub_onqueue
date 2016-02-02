class AddDoctorIdToRecords < ActiveRecord::Migration
  def change
    add_column :records, :doctor_id, :integer
  end
end
