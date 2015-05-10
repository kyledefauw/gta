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

ActiveRecord::Schema.define(version: 20150510205318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crops", force: :cascade do |t|
    t.string "name"
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name"
  end

  create_table "plants", force: :cascade do |t|
    t.string  "strain_name"
    t.string  "sex"
    t.string  "from"
    t.integer "crop_id"
  end

  create_table "stage_of_growths", force: :cascade do |t|
    t.string "stage"
    t.date   "plant_date"
    t.string "pot_size"
    t.text   "grow_medium"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end