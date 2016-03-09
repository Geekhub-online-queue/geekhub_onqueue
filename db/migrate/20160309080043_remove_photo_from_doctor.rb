class RemovePhotoFromDoctor < ActiveRecord::Migration
  def change
    remove_column :doctors, :photo
  end
end
