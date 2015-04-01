class DropFacilities < ActiveRecord::Migration
  def change
    drop_table :facilities
  end
end
