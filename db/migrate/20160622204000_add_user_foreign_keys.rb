class AddUserForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :smash_settings, :users
    add_foreign_key :smash_reports, :users
    add_foreign_key :merge_reports, :users

    rename_column :blacklist_entries, :username, :user_id
    change_column :blacklist_entries, :user_id, :integer, null: false
    add_foreign_key :blacklist_entries, :users
  end
end
