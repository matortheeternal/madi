class CreateBlacklistEntries < ActiveRecord::Migration
  def change
    create_table :blacklist_entries do |t|
      t.string :ip, :limit => 32, :null => false
      t.string :username, :limit => 32
      t.datetime :created
      t.datetime :expires
    end
  end
end
