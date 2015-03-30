class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
    	t.string :name
      t.string :location
      t.string :zipcode 
    end
  end
end
