class CreateMatorSmashStatistics < ActiveRecord::Migration
  def change
    create_table :mator_smash_statistics do |t|
      t.integer :user_id
      t.integer :times_run
      t.integer :patches_build
      t.integer :settings_created
      t.integer :plugins_smashed
      t.integer :reports_submitted
      t.integer :settings_submitted

      t.timestamps null: false
    end
  end
end
