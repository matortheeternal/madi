class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :label, limit: 32, null: false
      t.string :version, limit: 32, null: false
    end
  end
end
