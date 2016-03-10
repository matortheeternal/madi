class FixIdColumns < ActiveRecord::Migration
  def change
    remove_foreign_key :merge_plugins_statistics, :users
    remove_foreign_key :mator_smash_statistics, :users

    execute('ALTER TABLE users MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;')
    execute('ALTER TABLE blacklist_entries MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;')
    execute('ALTER TABLE mator_smash_statistics MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;')
    execute('ALTER TABLE merge_plugins_statistics MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;')
    execute('ALTER TABLE merge_reports MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;')
    execute('ALTER TABLE smash_reports MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;')
    execute('ALTER TABLE smash_settings MODIFY id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT;')

    add_foreign_key :merge_plugins_statistics, :users
    add_foreign_key :mator_smash_statistics, :users
  end
end
