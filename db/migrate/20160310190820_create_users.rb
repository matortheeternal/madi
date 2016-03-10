class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :role
      t.datetime :first_seen
      t.datetime :last_seen
      t.integer :times_seen
      t.integer :download
      t.integer :upload

      t.timestamps null: false
    end
  end
end
