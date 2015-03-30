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

ActiveRecord::Schema.define(version: 20150330233504) do

  create_table "facilities", force: :cascade do |t|
    t.string  "facility_name"
    t.string  "game_category"
    t.integer "park_id"
  end

  create_table "games", force: :cascade do |t|
    t.string  "description"
    t.date    "date"
    t.time    "time"
    t.string  "game_category"
    t.integer "player_limit"
    t.integer "facility_id"
    t.integer "host_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "zipcode"
  end

  create_table "players", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "zipcode"
    t.string  "profile_picture"
    t.string  "favorite_games"
    t.boolean "host"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
  end

end
