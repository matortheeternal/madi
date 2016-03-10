class RemoveRedundantUserColumns < ActiveRecord::Migration
  def change
    remove_column :users, :times_seen
    remove_column :users, :download
    remove_column :users, :upload
  end
end
