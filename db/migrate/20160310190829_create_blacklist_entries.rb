class CreateBlacklistEntries < ActiveRecord::Migration
  def change
    create_table :blacklist_entries do |t|
      t.string :ip
      t.string :username
      t.datetime :created
      t.datetime :expires

      t.timestamps null: false
    end
  end
end
