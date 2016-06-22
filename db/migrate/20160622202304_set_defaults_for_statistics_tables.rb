class SetDefaultsForStatisticsTables < ActiveRecord::Migration
  def change
    change_column :mator_smash_statistics, :times_run, :integer, default: 0
    change_column :mator_smash_statistics, :patches_built, :integer, default: 0
    change_column :mator_smash_statistics, :settings_created, :integer, default: 0
    change_column :mator_smash_statistics, :plugins_smashed, :integer, default: 0
    change_column :mator_smash_statistics, :reports_submitted, :integer, default: 0
    change_column :mator_smash_statistics, :settings_submitted, :integer, default: 0

    change_column :merge_plugins_statistics, :times_run, :integer, default: 0
    change_column :merge_plugins_statistics, :merges_built, :integer, default: 0
    change_column :merge_plugins_statistics, :plugins_checked, :integer, default: 0
    change_column :merge_plugins_statistics, :plugins_fixed, :integer, default: 0
    change_column :merge_plugins_statistics, :plugins_merged, :integer, default: 0
    change_column :merge_plugins_statistics, :reports_submitted, :integer, default: 0
  end
end
