class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :title
      t.string :city
      t.string :phone
      t.string :address
      t.string :description
      t.string :photo

      t.timestamps null: false
    end
  end
end
