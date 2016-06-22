# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160622204000) do

  create_table "blacklist_entries", force: :cascade do |t|
    t.string   "ip",      limit: 32, null: false
    t.integer  "user_id", limit: 4,  null: false
    t.datetime "created"
    t.datetime "expires"
  end

  add_index "blacklist_entries", ["ip"], name: "index_blacklist_entries_on_ip", unique: true, using: :btree
  add_index "blacklist_entries", ["user_id"], name: "fk_rails_8a26e4eea8", using: :btree

  create_table "mator_smash_statistics", force: :cascade do |t|
    t.integer  "user_id",            limit: 4,             null: false
    t.integer  "times_run",          limit: 4, default: 0
    t.integer  "patches_built",      limit: 4, default: 0
    t.integer  "settings_created",   limit: 4, default: 0
    t.integer  "plugins_smashed",    limit: 4, default: 0
    t.integer  "reports_submitted",  limit: 4, default: 0
    t.integer  "settings_submitted", limit: 4, default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "mator_smash_statistics", ["user_id"], name: "fk_rails_77299b4220", using: :btree

  create_table "merge_plugins_statistics", force: :cascade do |t|
    t.integer  "user_id",           limit: 4,             null: false
    t.integer  "times_run",         limit: 4, default: 0
    t.integer  "merges_built",      limit: 4, default: 0
    t.integer  "plugins_checked",   limit: 4, default: 0
    t.integer  "plugins_fixed",     limit: 4, default: 0
    t.integer  "plugins_merged",    limit: 4, default: 0
    t.integer  "reports_submitted", limit: 4, default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "merge_plugins_statistics", ["user_id"], name: "fk_rails_6bba2276ea", using: :btree

  create_table "merge_reports", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,                   null: false
    t.boolean  "approved",                  default: false
    t.string   "game",          limit: 32,                  null: false
    t.string   "filename",      limit: 64,                  null: false
    t.string   "file_hash",     limit: 16,                  null: false
    t.integer  "record_count",  limit: 4,                   null: false
    t.integer  "rating",        limit: 1,                   null: false
    t.string   "merge_version", limit: 16,                  null: false
    t.string   "notes",         limit: 255
    t.datetime "approved_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "merge_reports", ["user_id"], name: "fk_rails_7439b24921", using: :btree

  create_table "smash_reports", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,                   null: false
    t.boolean  "approved",                     default: false
    t.integer  "smash_setting_id", limit: 4,                   null: false
    t.string   "game",             limit: 32,                  null: false
    t.string   "filename",         limit: 64,                  null: false
    t.string   "file_hash",        limit: 16,                  null: false
    t.integer  "record_count",     limit: 4,                   null: false
    t.string   "smash_version",    limit: 16,                  null: false
    t.string   "notes",            limit: 255
    t.datetime "approved_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "smash_reports", ["user_id"], name: "fk_rails_57aff555cf", using: :btree

  create_table "smash_settings", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,                     null: false
    t.boolean  "approved",                   default: false
    t.string   "game",         limit: 32,                    null: false
    t.string   "name",         limit: 64,                    null: false
    t.string   "setting_hash", limit: 8,                     null: false
    t.integer  "color",        limit: 4,                     null: false
    t.string   "records",      limit: 512
    t.string   "description",  limit: 1024
    t.text     "tree",         limit: 65535
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "smash_settings", ["user_id"], name: "fk_rails_c34aa73ee0", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 32,                   null: false
    t.string   "role",                   limit: 16,  default: "user"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "email",                  limit: 255, default: "",     null: false
    t.string   "encrypted_password",     limit: 255, default: "",     null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "blacklist_entries", "users"
  add_foreign_key "mator_smash_statistics", "users"
  add_foreign_key "merge_plugins_statistics", "users"
  add_foreign_key "merge_reports", "users"
  add_foreign_key "smash_reports", "users"
  add_foreign_key "smash_settings", "users"
end
