class ReorderColumns < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, default: nil, null: false, after: :role
  end
end
