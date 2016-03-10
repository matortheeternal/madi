class CreateMatorSmashStatistics < ActiveRecord::Migration
  def change
    create_table :mator_smash_statistics do |t|
      t.integer :user_id, :null => false
      t.integer :times_run
      t.integer :patches_build
      t.integer :settings_created
      t.integer :plugins_smashed
      t.integer :reports_submitted
      t.integer :settings_submitted

      t.timestamps null: false
    end
    
    reversible do |dir|
      dir.up do
        execute('ALTER TABLE mator_smash_statistics MODIFY id INT UNSIGNED NOT NULL')
        execute('ALTER TABLE mator_smash_statistics MODIFY user_id INT UNSIGNED NOT NULL')
      end
    end
    
    add_foreign_key :mator_smash_statistics, :users, column: :user_id
  end
end
