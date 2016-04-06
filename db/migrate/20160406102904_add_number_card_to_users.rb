class AddNumberCardToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_card, :string
  end
end
