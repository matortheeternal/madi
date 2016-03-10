class CreateMergePluginsStatistics < ActiveRecord::Migration
  def change
    create_table :merge_plugins_statistics do |t|
      t.integer :user_id
      t.integer :times_run
      t.integer :merges_built
      t.integer :plugins_checked
      t.integer :plugins_fixed
      t.integer :plugins_merged
      t.integer :reports_submitted

      t.timestamps null: false
    end
  end
end
