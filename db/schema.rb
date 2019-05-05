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

ActiveRecord::Schema.define(version: 2019_05_05_171532) do

  create_table "locations", force: :cascade do |t|
    t.string "latitude"
    t.string "longitude"
    t.integer "survivor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survivor_id"], name: "index_locations_on_survivor_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "victim_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_reports_on_sender_id"
    t.index ["victim_id"], name: "index_reports_on_victim_id"
  end

  create_table "survivors", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "gender"
    t.boolean "abducted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end