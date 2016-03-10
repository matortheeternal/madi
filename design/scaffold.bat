:: USERS and BLACKLIST ENTRIES

call rails g scaffold users username:string role:string first_seen:datetime last_seen:datetime times_seen:integer download:integer upload:integer

call rails g scaffold blacklist_entries ip:string username:string created:datetime expires:datetime

:: STATISTICS

call rails g scaffold merge_plugins_statistics user_id:integer times_run:integer merges_built:integer plugins_checked:integer plugins_fixed:integer plugins_merged:integer reports_submitted:integer

call rails g scaffold mator_smash_statistics user_id:integer times_run:integer patches_build:integer settings_created:integer plugins_smashed:integer reports_submitted:integer settings_submitted:integer

:: SMASH SETTINGS

call rails g scaffold smash_settings submitted_by:string game:string name:string hash:string color:integer records:string description:string tree:text

:: REPORTS

call rails g scaffold merge_reports submitted_by:string approved:boolean game:string filename:string hash:string record_count:integer rating:integer merge_version:string notes:string approved_at:timestamp

call rails g scaffold smash_reports submitted_by:string approved:boolean smash_setting_id:integer game:string filename:string hash:string record_count:integer smash_version:string notes:string approveD_at:timestamp