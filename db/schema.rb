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

ActiveRecord::Schema.define(version: 20150531032352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.integer  "per_week"
    t.integer  "number_of_month"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dev_conditions", force: :cascade do |t|
    t.integer  "dev_id"
    t.integer  "condition_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "dev_conditions", ["condition_id"], name: "index_dev_conditions_on_condition_id", using: :btree
  add_index "dev_conditions", ["dev_id"], name: "index_dev_conditions_on_dev_id", using: :btree

  create_table "dev_skills", force: :cascade do |t|
    t.integer  "dev_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dev_skills", ["dev_id"], name: "index_dev_skills_on_dev_id", using: :btree
  add_index "dev_skills", ["skill_id"], name: "index_dev_skills_on_skill_id", using: :btree

  create_table "dev_softwares", force: :cascade do |t|
    t.integer  "dev_id"
    t.integer  "software_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dev_softwares", ["dev_id"], name: "index_dev_softwares_on_dev_id", using: :btree
  add_index "dev_softwares", ["software_id"], name: "index_dev_softwares_on_software_id", using: :btree

  create_table "devs", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "role_id"
    t.integer  "availability_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "devs", ["availability_id"], name: "index_devs_on_availability_id", using: :btree
  add_index "devs", ["role_id"], name: "index_devs_on_role_id", using: :btree

  create_table "opening_skills", force: :cascade do |t|
    t.integer  "opening_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "opening_skills", ["opening_id"], name: "index_opening_skills_on_opening_id", using: :btree
  add_index "opening_skills", ["skill_id"], name: "index_opening_skills_on_skill_id", using: :btree

  create_table "opening_softwares", force: :cascade do |t|
    t.integer  "opening_id"
    t.integer  "software_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "opening_softwares", ["opening_id"], name: "index_opening_softwares_on_opening_id", using: :btree
  add_index "opening_softwares", ["software_id"], name: "index_opening_softwares_on_software_id", using: :btree

  create_table "openings", force: :cascade do |t|
    t.text     "name"
    t.integer  "role_id"
    t.integer  "availability_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "openings", ["availability_id"], name: "index_openings_on_availability_id", using: :btree
  add_index "openings", ["role_id"], name: "index_openings_on_role_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.text     "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.text     "short_name"
    t.text     "long_name"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["role_id"], name: "index_skills_on_role_id", using: :btree

  create_table "softwares", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dev_conditions", "conditions"
  add_foreign_key "dev_conditions", "devs"
  add_foreign_key "dev_skills", "devs"
  add_foreign_key "dev_skills", "skills"
  add_foreign_key "dev_softwares", "devs"
  add_foreign_key "dev_softwares", "softwares"
  add_foreign_key "devs", "availabilities"
  add_foreign_key "devs", "roles"
  add_foreign_key "opening_skills", "openings"
  add_foreign_key "opening_skills", "skills"
  add_foreign_key "opening_softwares", "openings"
  add_foreign_key "opening_softwares", "softwares"
  add_foreign_key "openings", "availabilities"
  add_foreign_key "openings", "roles"
  add_foreign_key "skills", "roles"
end
