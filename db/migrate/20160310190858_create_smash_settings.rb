class CreateSmashSettings < ActiveRecord::Migration
  def change
    create_table :smash_settings do |t|
      t.string :submitted_by
      t.string :game
      t.string :name
      t.string :hash
      t.integer :color
      t.string :records
      t.string :description
      t.text :tree

      t.timestamps null: false
    end
  end
end
