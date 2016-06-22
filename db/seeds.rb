#==================================================
# HELPER METHODS
#==================================================

def randpow(num, pow)
  result = 1.0
  for i in 1..pow
    result *= rand(10000)/10000.0
  end
  (num * result).floor
end

#==================================================
# CONFIGURATION OPTIONS
#==================================================

bSeedUsers = true
bSeedStatistics = true
bSeedSettings = true
bSeedReports = true

#==================================================
# CREATE USERS
#==================================================
require 'securerandom'

if bSeedUsers
  puts "\nSeeding users"
  # create an admin user
  pw = SecureRandom.urlsafe_base64
  User.create!(
      username: "admin",
      role: "admin",
      email: "admin@mail.com",
      password: pw,
      password_confirmation: pw,
      confirmed_at: Time.now.to_date,
  )
  puts "    admin seeded with password: #{pw}"

  # create 9 random users
  9.times do |n|
    name = Faker::Internet.user_name
    pw = SecureRandom.urlsafe_base64
    User.create!(
        username: "#{name}#{n}",
        email: Faker::Internet.email(name),
        password: pw,
        password_confirmation: pw,
        confirmed_at: Time.now.to_date
    )
  end
  puts "    #{User.count} users seeded"
end

#==================================================
# CREATE STATISTICS
#==================================================

if bSeedSettings
  puts "\nSeeding statistics"

  for user in User.all
    MergePluginsStatistic.create(
        user_id: user.id,
        times_run: Faker::Number.between(1, 100),
        merges_built: Faker::Number.between(0, 10),
        plugins_checked: Faker::Number.between(0, 255),
        plugins_fixed: Faker::Number.between(0, 64),
        plugins_merged: Faker::Number.between(0, 128),
        reports_submitted: Faker::Number.between(0, 12)
    ).save!

    MatorSmashStatistic.create(
        user_id: user.id,
        times_run: Faker::Number.between(1, 100),
        patches_built: Faker::Number.between(0, 10),
        settings_created: Faker::Number.between(0, 12),
        plugins_smashed: Faker::Number.between(0, 255),
        reports_submitted: Faker::Number.between(0, 12),
        settings_submitted: Faker::Number.between(0, 4)
    ).save!
  end
end

#==================================================
# CREATE SMASH SETTINGS
#==================================================

if bSeedSettings
  puts "\nSeeding smash settings"

  for user in User.all
    rnd = randpow(10, 2)
    puts "    Generating #{rnd} smash settings from #{user.username}"
    rnd.times do
      SmashSetting.create(
          submitted_by: user.username,
          game: 'Skyrim',
          name: Faker::Lorem.words(2).join(" "),
          setting_hash: Faker::Number.hexadecimal(8),
          color: Faker::Number.between(0, 0x00FFFFFF),
          records: Faker::Lorem.words(randpow(10, 2)).join(" "),
          description: Faker::Lorem.paragraph(3)
      ).save!
    end
  end

  puts "    #{SmashSetting.count} smash settings seeded"
end

#==================================================
# CREATE REPORTS
#==================================================

if bSeedReports
  puts "\nSeeding reports"
  for user in User.all
    rnd = randpow(10, 2)
    puts "    Generating #{rnd} smash reports from #{user.username}"
    rnd.times do
      setting = SmashSetting.offset(rand(SmashSetting.count)).first
      SmashReport.create(
          submitted_by: user.username,
          smash_setting_id: setting.id,
          game: 'Skyrim',
          filename: Faker::Lorem.words(3).join(" ") + '.esp',
          file_hash: Faker::Number.hexadecimal(16),
          record_count: Faker::Number.between(0, 1000),
          smash_version: '0.3.1',
          notes: Faker::Lorem.paragraph(3)
      ).save!
    end

    rnd = randpow(10, 2)
    puts "    Generating #{rnd} merge reports from #{user.username}"
    rnd.times do
      MergeReport.create(
          submitted_by: user.username,
          game: 'Skyrim',
          filename: Faker::Lorem.words(3).join(" ") + '.esp',
          file_hash: Faker::Number.hexadecimal(16),
          record_count: Faker::Number.between(0, 1000),
          rating: Faker::Number.between(0, 4),
          merge_version: '2.3.1',
          notes: Faker::Lorem.paragraph(3)
      ).save!
    end
  end
end