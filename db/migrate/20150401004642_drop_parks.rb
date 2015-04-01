class DropParks < ActiveRecord::Migration
  def change
    drop_table :parks
  end
end
