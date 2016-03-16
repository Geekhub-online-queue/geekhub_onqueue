class ChangeSpecializationInDoctors < ActiveRecord::Migration
  def change
    rename_column :doctors, :specialization, :specialization_id
  end
end
