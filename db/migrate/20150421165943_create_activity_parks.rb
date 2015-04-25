class CreateActivityParks < ActiveRecord::Migration
  def change
    create_table :activity_parks do |t|
      t.integer :park_id
      t.integer :activity_id
    end
  end
end
