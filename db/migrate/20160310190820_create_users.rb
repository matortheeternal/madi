class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 32, :null => false
      t.string :role, :limit => 16, :default => :user
      t.integer :times_seen, :default => 1
      t.integer :download, :limit => 8
      t.integer :upload, :limit => 8

      t.timestamps null: false
    end
  end
end
