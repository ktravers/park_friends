class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.string :description
      t.date :date
      t.time :time
      t.string :game_category 
      t.integer :player_limit, :default => 10
      t.integer :park_id
      t.integer :host_id
      t.string :additional_info
    end
  end
end
