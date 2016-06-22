class RefactorSubmittedByColumns < ActiveRecord::Migration
  def change
    rename_column :merge_reports, :submitted_by, :user_id
    rename_column :smash_reports, :submitted_by, :user_id
    rename_column :smash_settings, :submitted_by, :user_id

    change_column :merge_reports, :user_id, :integer, null: false
    change_column :smash_reports, :user_id, :integer, null: false
    change_column :smash_settings, :user_id, :integer, null: false
  end
end
