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

ActiveRecord::Schema.define(version: 20150527005731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caretakers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "garden_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crops", force: :cascade do |t|
    t.string  "name"
    t.integer "garden_id"
  end

  create_table "feedings", force: :cascade do |t|
    t.string   "water_amount"
    t.string   "nutrients_added"
    t.string   "ppm_level"
    t.string   "ph_level"
    t.integer  "plant_task_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "gardens", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "general_notes", force: :cascade do |t|
    t.text     "notes"
    t.integer  "plant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grow_medium", force: :cascade do |t|
    t.string   "brand"
    t.string   "nutrients_added"
    t.integer  "stage_of_growth_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "plant_images", force: :cascade do |t|
    t.string   "plant_picture"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "plant_id"
  end

  create_table "plant_tasks", force: :cascade do |t|
    t.boolean  "topped"
    t.boolean  "trimmed"
    t.boolean  "staked"
    t.boolean  "clipped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string  "strain_name"
    t.string  "sex"
    t.string  "from"
    t.integer "crop_id"
    t.string  "id_number"
  end

  create_table "sprayings", force: :cascade do |t|
    t.string   "water_amount"
    t.string   "chemicals_added"
    t.integer  "plant_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "stage_of_growths", force: :cascade do |t|
    t.string   "stage"
    t.datetime "plant_date"
    t.string   "pot_size"
    t.text     "grow_medium"
    t.integer  "plant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
