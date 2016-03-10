class CreateMergeReports < ActiveRecord::Migration
  def change
    create_table :merge_reports do |t|
      t.string :submitted_by
      t.boolean :approved
      t.string :game
      t.string :filename
      t.string :hash
      t.integer :record_count
      t.integer :rating
      t.string :merge_version
      t.string :notes
      t.timestamp :approved_at

      t.timestamps null: false
    end
  end
end
