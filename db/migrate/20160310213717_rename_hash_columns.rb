class RenameHashColumns < ActiveRecord::Migration
  def change
    rename_column :merge_reports, :hash, :file_hash
    rename_column :smash_reports, :hash, :file_hash
    rename_column :smash_settings, :hash, :setting_hash
  end
end
