class RenamePatchesBuildColumn < ActiveRecord::Migration
  def change
    rename_column :mator_smash_statistics, :patches_build, :patches_built
  end
end
