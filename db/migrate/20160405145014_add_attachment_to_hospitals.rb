class AddAttachmentToHospitals < ActiveRecord::Migration
  def self.up
    change_table :hospitals do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :hospitals, :photo
  end
end
