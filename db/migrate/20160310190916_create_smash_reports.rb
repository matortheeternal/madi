class CreateSmashReports < ActiveRecord::Migration
  def change
    create_table :smash_reports do |t|
      t.string :submitted_by
      t.boolean :approved
      t.integer :smash_setting_id
      t.string :game
      t.string :filename
      t.string :hash
      t.integer :record_count
      t.string :smash_version
      t.string :notes
      t.timestamp :approveD_at

      t.timestamps null: false
    end
  end
end
