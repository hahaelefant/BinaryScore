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

ActiveRecord::Schema.define(version: 20141008182337) do

  create_table "match_events", force: true do |t|
    t.string   "eventtype"
    t.integer  "minute"
    t.integer  "player_id"
    t.string   "player_name"
    t.integer  "team_id"
    t.string   "score"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "match_events", ["match_id"], name: "match_events_match_id_fk", using: :btree
  add_index "match_events", ["team_id"], name: "match_events_team_id_fk", using: :btree

  create_table "matches", force: true do |t|
    t.date     "date"
    t.datetime "time"
    t.integer  "home_team"
    t.integer  "home_score"
    t.integer  "visitor_team"
    t.integer  "visitor_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["home_team"], name: "matches_home_team_fk", using: :btree
  add_index "matches", ["visitor_team"], name: "matches_visitor_team_fk", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wins"
    t.integer  "draws"
    t.integer  "defeats"
    t.integer  "goals_scored"
    t.integer  "goals_conceded"
    t.integer  "goaldifference"
    t.integer  "points"
  end

  add_foreign_key "match_events", "matches", name: "match_events_match_id_fk"
  add_foreign_key "match_events", "teams", name: "match_events_team_id_fk"

  add_foreign_key "matches", "teams", name: "matches_home_team_fk", column: "home_team"
  add_foreign_key "matches", "teams", name: "matches_visitor_team_fk", column: "visitor_team"

end
