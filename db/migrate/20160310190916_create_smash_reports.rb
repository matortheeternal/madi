class CreateSmashReports < ActiveRecord::Migration
  def change
    create_table :smash_reports do |t|
      t.string :submitted_by, :limit => 32, :null => false
      t.boolean :approved, :default => false
      t.integer :smash_setting_id, :null => false
      t.string :game, :limit => 32, :null => false
      t.string :filename, :limit => 64, :null => false
      t.string :hash, :limit => 16, :null => false
      t.integer :record_count, :null => false
      t.string :smash_version, :limit => 16, :null => false
      t.string :notes, :limit => 255
      t.timestamp :approved_at

      t.timestamps null: false
    end
    
    reversible do |dir|
      dir.up do
        execute('ALTER TABLE smash_reports MODIFY id INT UNSIGNED NOT NULL')
        execute('ALTER TABLE smash_reports MODIFY smash_setting_id INT UNSIGNED NOT NULL')
      end
    end
  end
end
