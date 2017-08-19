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

ActiveRecord::Schema.define(version: 20170819170130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "street_address"
    t.string   "apt_number"
    t.string   "postal_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "camps", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "camps_directors", id: false, force: :cascade do |t|
    t.integer "camp_id",     null: false
    t.integer "director_id", null: false
  end

  create_table "counselors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "alias"
    t.boolean  "training"
    t.string   "account_status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "counselors_groups", id: false, force: :cascade do |t|
    t.integer "counselor_id", null: false
    t.integer "group_id",     null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string   "privileges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "camp_id"
    t.string   "name"
    t.integer  "min_age"
    t.integer  "max_age"
    t.date     "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_kids", id: false, force: :cascade do |t|
    t.integer "kid_id",   null: false
    t.integer "group_id", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "sin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids_parents", id: false, force: :cascade do |t|
    t.integer "kid_id",    null: false
    t.integer "parent_id", null: false
  end

  create_table "medical_infos", force: :cascade do |t|
    t.integer  "kid_id"
    t.text     "allergies"
    t.text     "conditions"
    t.text     "medications"
    t.text     "dietary_restrictions"
    t.boolean  "epi_pen"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "medicare"
  end

  create_table "parents", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "address_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
  end

end
