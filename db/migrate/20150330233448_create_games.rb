class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.string :description
      t.date :date
      t.time :time
      t.string :game_category 
      t.integer :player_limit
      t.integer :facility_id
      t.integer :host_id
    end
  end
end
