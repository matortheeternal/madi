class CreateSmashSettings < ActiveRecord::Migration
  def change
    create_table :smash_settings do |t|
      t.string :submitted_by, :limit => 32, :null => false
      t.boolean :approved, :default => false
      t.string :game, :limit => 32, :null => false
      t.string :name, :limit => 64, :null => false
      t.string :hash, :limit => 8, :null => false
      t.integer :color, :null => false
      t.string :records, :limit => 512
      t.string :description, :limit => 1024
      t.text :tree

      t.timestamps null: false
    end
    
    reversible do |dir|
      dir.up do
        execute('ALTER TABLE smash_settings MODIFY id INT UNSIGNED NOT NULL')
      end
    end
  end
end
