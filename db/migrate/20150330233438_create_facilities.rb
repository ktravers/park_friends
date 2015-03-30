class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
    	t.string :facility_name
      t.string :game_category
      t.integer :park_id
    end
  end
end
