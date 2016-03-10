class CreateBlacklistEntries < ActiveRecord::Migration
  def change
    create_table :blacklist_entries do |t|
      t.string :ip, :limit => 32, :null => false
      t.string :username, :limit => 32
      t.datetime :created
      t.datetime :expires
    end
    
    reversible do |dir|
      dir.up do
        execute('ALTER TABLE blacklist_entries MODIFY id INT UNSIGNED NOT NULL')
      end
    end
    
    add_index :blacklist_entries, :ip, :unique => true
  end
end
