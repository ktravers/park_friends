class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
      t.string :last_name
      t.string :email
      t.string :zipcode
      t.string :profile_picture, default: "images/default-profile-pic.png"
      t.string :favorite_games
      t.boolean :host
    end
  end
end
