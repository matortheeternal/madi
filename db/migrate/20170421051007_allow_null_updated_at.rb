class AllowNullUpdatedAt < ActiveRecord::Migration
  def change
    change_column :smash_settings, :updated_at, :datetime, null: true
    change_column :smash_reports, :updated_at, :datetime, null: true
    change_column :merge_reports, :updated_at, :datetime, null: true
    change_column :merge_plugins_statistics, :updated_at, :datetime, null: true
    change_column :mator_smash_statistics, :updated_at, :datetime, null: true
  end
end
