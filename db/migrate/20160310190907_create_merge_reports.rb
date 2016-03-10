class CreateMergeReports < ActiveRecord::Migration
  def change
    create_table :merge_reports do |t|
      t.string :submitted_by, :limit => 32, :null => false
      t.boolean :approved, :default => false
      t.string :game, :limit => 32, :null => false
      t.string :filename, :limit => 64, :null => false
      t.string :hash, :limit => 16, :null => false
      t.integer :record_count, :null => false
      t.integer :rating, :limit => 1, :null => false
      t.string :merge_version, :limit => 16, :null => false
      t.string :notes, :limit => 255
      t.timestamp :approved_at

      t.timestamps null: false
    end
    
    reversible do |dir|
      dir.up do
        execute('ALTER TABLE merge_reports MODIFY id INT UNSIGNED NOT NULL')
      end
    end
  end
end
