class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :phone
      t.string :specialization
      t.string :photo
      t.string :description

      t.timestamps null: false
    end
  end
end
