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

ActiveRecord::Schema.define(version: 5) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.string   "slogan"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phases", force: :cascade do |t|
    t.integer  "game_id",     null: false
    t.string   "name",        null: false
    t.string   "description", null: false
    t.integer  "time",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "phases", ["game_id"], name: "index_phases_on_game_id", using: :btree

  create_table "phasestarts", force: :cascade do |t|
    t.integer  "phase_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "date_ini"
    t.datetime "date_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phasestarts", ["phase_id"], name: "index_phasestarts_on_phase_id", using: :btree
  add_index "phasestarts", ["user_id"], name: "index_phasestarts_on_user_id", using: :btree

  create_table "starts", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "game_id",     null: false
    t.integer  "number_team", null: false
    t.string   "key_master",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "starts", ["user_id"], name: "index_starts_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "start_id",   null: false
    t.integer  "user_id",    null: false
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["start_id"], name: "index_teams_on_start_id", using: :btree
  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nikename",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "gender"
    t.string   "institution"
    t.string   "course"
    t.string   "profile",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "phases", "games"
  add_foreign_key "phasestarts", "phases"
  add_foreign_key "phasestarts", "users"
  add_foreign_key "starts", "games"
  add_foreign_key "starts", "users"
  add_foreign_key "teams", "starts"
  add_foreign_key "teams", "users"
end
