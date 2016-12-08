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

ActiveRecord::Schema.define(version: 20161118033733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.bigint   "count",        default: 0, null: false
  end

  create_table "applications", force: :cascade do |t|
    t.integer  "user_id",               null: false
    t.integer  "birth_day",             null: false
    t.integer  "birth_month",           null: false
    t.integer  "birth_year",            null: false
    t.string   "education",             null: false
    t.string   "university"
    t.string   "other_university"
    t.string   "travel_origin"
    t.string   "graduation_season",     null: false
    t.integer  "graduation_year",       null: false
    t.text     "major",                              array: true
    t.integer  "hackathons",            null: false
    t.string   "github"
    t.string   "linkedin"
    t.string   "website"
    t.string   "devpost"
    t.string   "other_link"
    t.text     "statement"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "race",                               array: true
    t.string   "gender"
    t.string   "outside_north_america"
    t.index ["user_id"], name: "index_applications_on_user_id", using: :btree
  end

  create_table "batches", force: :cascade do |t|
    t.string   "token",      null: false
    t.text     "hackers",    null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "display",    null: false
    t.integer  "priority",   null: false
    t.index ["user_id"], name: "index_faqs_on_user_id", using: :btree
  end

  create_table "geo_ips", force: :cascade do |t|
    t.inet     "ip_address"
    t.bigint   "count",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "level",          null: false
    t.string   "url",            null: false
    t.text     "logo_svg_light", null: false
    t.text     "logo_svg_dark"
    t.text     "logo_png_light", null: false
    t.text     "logo_png_dark"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "auth_token",             default: ""
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "applications", "users"
  add_foreign_key "faqs", "users"
end
