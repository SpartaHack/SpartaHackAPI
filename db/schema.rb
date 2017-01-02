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

ActiveRecord::Schema.define(version: 20170102010841) do

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
    t.string   "status"
    t.datetime "accepted_date"
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

  create_table "installations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "device_type"
    t.text     "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["token"], name: "index_installations_on_token", unique: true, using: :btree
    t.index ["user_id"], name: "index_installations_on_user_id", using: :btree
  end

  create_table "rpush_apps", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "environment"
    t.text     "certificate"
    t.string   "password"
    t.integer  "connections",             default: 1, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "type",                                null: false
    t.string   "auth_key"
    t.string   "client_id"
    t.string   "client_secret"
    t.string   "access_token"
    t.datetime "access_token_expiration"
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string   "device_token", limit: 64, null: false
    t.datetime "failed_at",               null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "app_id"
    t.index ["device_token"], name: "index_rpush_feedback_on_device_token", using: :btree
  end

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer  "badge"
    t.string   "device_token",      limit: 64
    t.string   "sound",                        default: "default"
    t.text     "alert"
    t.text     "data"
    t.integer  "expiry",                       default: 86400
    t.boolean  "delivered",                    default: false,     null: false
    t.datetime "delivered_at"
    t.boolean  "failed",                       default: false,     null: false
    t.datetime "failed_at"
    t.integer  "error_code"
    t.text     "error_description"
    t.datetime "deliver_after"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "alert_is_json",                default: false
    t.string   "type",                                             null: false
    t.string   "collapse_key"
    t.boolean  "delay_while_idle",             default: false,     null: false
    t.text     "registration_ids"
    t.integer  "app_id",                                           null: false
    t.integer  "retries",                      default: 0
    t.string   "uri"
    t.datetime "fail_after"
    t.boolean  "processing",                   default: false,     null: false
    t.integer  "priority"
    t.text     "url_args"
    t.string   "category"
    t.boolean  "content_available",            default: false
    t.text     "notification"
    t.index ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))", using: :btree
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.string   "attending",                  null: false
    t.text     "dietary_restrictions"
    t.string   "other_dietary_restrictions"
    t.text     "resume"
    t.string   "shirt_size"
    t.string   "carpool_sharing"
    t.string   "jobs"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_rsvps_on_user_id", using: :btree
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
  add_foreign_key "installations", "users"
  add_foreign_key "rsvps", "users"
end
