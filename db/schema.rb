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

ActiveRecord::Schema.define(version: 20160119040743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "availabilities", force: :cascade do |t|
    t.datetime  "created_at",      null: false
    t.datetime  "updated_at",      null: false
    t.int4range "per_week"
    t.integer   "project_size_id", null: false
    t.integer   "available_id"
    t.string    "available_type"
  end

  add_index "availabilities", ["available_type", "available_id"], name: "index_availabilities_on_available_type_and_available_id", using: :btree
  add_index "availabilities", ["per_week"], name: "availabilities_gist_data", using: :gist
  add_index "availabilities", ["project_size_id"], name: "index_availabilities_on_project_size_id", using: :btree

  create_table "conditions", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "dev_conditions", force: :cascade do |t|
    t.integer  "dev_id",       null: false
    t.integer  "condition_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "dev_conditions", ["condition_id"], name: "index_dev_conditions_on_condition_id", using: :btree
  add_index "dev_conditions", ["dev_id"], name: "index_dev_conditions_on_dev_id", using: :btree

  create_table "dev_major_skills", force: :cascade do |t|
    t.integer  "dev_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dev_major_skills", ["dev_id"], name: "index_dev_major_skills_on_dev_id", using: :btree
  add_index "dev_major_skills", ["skill_id"], name: "index_dev_major_skills_on_skill_id", using: :btree

  create_table "dev_minor_skills", force: :cascade do |t|
    t.integer  "dev_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dev_minor_skills", ["dev_id"], name: "index_dev_minor_skills_on_dev_id", using: :btree
  add_index "dev_minor_skills", ["skill_id"], name: "index_dev_minor_skills_on_skill_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_id"
    t.integer  "main_skill_id"
    t.boolean  "unavailable",         default: false, null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.text     "languages",           default: [],                 array: true
    t.string   "facebook_handle"
    t.string   "google_handle"
    t.string   "tumblr_handle"
    t.string   "youtube_handle"
    t.string   "behance_handle"
    t.string   "instagram_handle"
    t.string   "twitter_handle"
    t.string   "deviantart_handle"
    t.string   "skype_handle"
    t.string   "vimeo_handle"
    t.string   "pinterest_handle"
    t.string   "linkedin_link"
  end

  add_index "devs", ["main_skill_id"], name: "index_devs_on_main_skill_id", using: :btree
  add_index "devs", ["role_id"], name: "index_devs_on_role_id", using: :btree
  add_index "devs", ["user_id"], name: "index_devs_on_user_id", using: :btree

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dev_id"
    t.integer  "project_id"
  end

  add_index "openings", ["dev_id"], name: "index_openings_on_dev_id", using: :btree
  add_index "openings", ["project_id"], name: "index_openings_on_project_id", using: :btree
  add_index "openings", ["role_id"], name: "index_openings_on_role_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "domain"
    t.boolean  "is_legit",    default: false
    t.string   "member_code"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id", using: :btree

  create_table "project_sizes", force: :cascade do |t|
    t.string  "text",                            null: false
    t.boolean "need_involvement", default: true, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.text     "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "actor_form"
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
    t.string   "filename"
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  add_index "user_projects", ["project_id"], name: "index_user_projects_on_project_id", using: :btree
  add_index "user_projects", ["user_id"], name: "index_user_projects_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "email",                                          null: false
    t.string   "encrypted_password", limit: 128,                 null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                 null: false
    t.boolean  "is_admin",                       default: false, null: false
    t.boolean  "is_super_admin",                 default: false, null: false
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "availabilities", "project_sizes"
  add_foreign_key "dev_conditions", "conditions"
  add_foreign_key "dev_conditions", "devs"
  add_foreign_key "dev_major_skills", "devs"
  add_foreign_key "dev_major_skills", "skills"
  add_foreign_key "dev_minor_skills", "devs"
  add_foreign_key "dev_minor_skills", "skills"
  add_foreign_key "dev_softwares", "devs"
  add_foreign_key "dev_softwares", "softwares"
  add_foreign_key "devs", "roles"
  add_foreign_key "devs", "skills", column: "main_skill_id"
  add_foreign_key "devs", "users"
  add_foreign_key "opening_skills", "openings"
  add_foreign_key "opening_skills", "skills"
  add_foreign_key "opening_softwares", "openings"
  add_foreign_key "opening_softwares", "softwares"
  add_foreign_key "openings", "devs"
  add_foreign_key "openings", "projects"
  add_foreign_key "openings", "roles"
  add_foreign_key "organizations", "users"
  add_foreign_key "skills", "roles"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
end
