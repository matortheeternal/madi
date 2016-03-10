namespace :setup do
  desc "Tasks for setup"

  namespace :reset do
    task ids: :environment do
      puts "\nResetting IDs"
      connection = ActiveRecord::Base.connection()
      connection.execute("ALTER TABLE blacklist_entries AUTO_INCREMENT = 0;")
      connection.execute("ALTER TABLE mator_smash_statistics AUTO_INCREMENT = 0;")
      connection.execute("ALTER TABLE merge_plugins_statistics AUTO_INCREMENT = 0;")
      connection.execute("ALTER TABLE merge_reports AUTO_INCREMENT = 0;")
      connection.execute("ALTER TABLE smash_reports AUTO_INCREMENT = 0;")
      connection.execute("ALTER TABLE smash_settings AUTO_INCREMENT = 0;")
      connection.execute("ALTER TABLE users AUTO_INCREMENT = 0;")
      puts "    IDs reset"
    end

    task db: :environment do
      puts "\nResetting database"

      BlacklistEntry.delete_all
      MatorSmashStatistic.delete_all
      MergePluginsStatistic.delete_all
      MergeReport.delete_all
      SmashReport.delete_all
      SmashSetting.delete_all
      User.delete_all
      
      puts "    Database reset"
    end
  end

end
