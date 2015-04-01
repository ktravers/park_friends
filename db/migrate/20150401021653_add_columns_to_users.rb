class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, :default => 'facebook'
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :expires_at, :integer
    add_column :users, :expires, :boolean, :default => true
  end
end
