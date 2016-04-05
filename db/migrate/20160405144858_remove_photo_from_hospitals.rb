class RemovePhotoFromHospitals < ActiveRecord::Migration
  def change
    remove_column :hospitals, :photo, :string
  end
end
