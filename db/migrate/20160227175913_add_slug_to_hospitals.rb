class AddSlugToHospitals < ActiveRecord::Migration
  def change
    add_column :hospitals, :slug, :string
    add_index :hospitals, :slug, unique: true
  end
end
