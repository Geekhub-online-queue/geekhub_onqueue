class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.string :phone
      t.datetime :data

      t.timestamps null: false
    end
  end
end
