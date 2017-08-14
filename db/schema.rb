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

ActiveRecord::Schema.define(version: 20170814045929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "uname"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "img"
    t.boolean  "is_active",              default: true
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "approved",       default: false
    t.string   "customer_token"
    t.integer  "type_id"
    t.integer  "admin_id"
    t.integer  "plan_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.binary   "key"
    t.index ["admin_id"], name: "index_businesses_on_admin_id", using: :btree
    t.index ["plan_id"], name: "index_businesses_on_plan_id", using: :btree
    t.index ["type_id"], name: "index_businesses_on_type_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sendable_id"
    t.string   "sendable_type"
    t.integer  "recipientable_id"
    t.string   "recipientable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "upload_id"
    t.string   "status"
    t.text     "draft"
    t.string   "file_name"
    t.integer  "user_id"
    t.integer  "nol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint   "file_size"
    t.index ["upload_id"], name: "index_jobs_on_upload_id", using: :btree
    t.index ["user_id"], name: "index_jobs_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sendable_id"
    t.string   "sendable_type"
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "conversation_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  end

  create_table "plan_businesses", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["business_id"], name: "index_plan_businesses_on_business_id", using: :btree
    t.index ["plan_id"], name: "index_plan_businesses_on_plan_id", using: :btree
  end

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.integer  "period"
    t.integer  "number_of_lines"
    t.integer  "number_of_files"
    t.integer  "size_of_files"
    t.integer  "number_of_users"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "super_admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "img"
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
    t.string   "name"
    t.index ["email"], name: "index_super_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_super_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "transcribers", force: :cascade do |t|
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
    t.string   "name"
    t.integer  "business_id"
    t.string   "img"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["business_id"], name: "index_transcribers_on_business_id", using: :btree
    t.index ["email"], name: "index_transcribers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_transcribers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.string   "file_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_uploads_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "uname"
    t.string   "encrypted_key"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean  "is_active",              default: true
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "business_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["business_id"], name: "index_users_on_business_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "businesses", "admins"
  add_foreign_key "businesses", "plans"
  add_foreign_key "businesses", "types"
  add_foreign_key "jobs", "uploads"
  add_foreign_key "jobs", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "plan_businesses", "businesses"
  add_foreign_key "plan_businesses", "plans"
  add_foreign_key "uploads", "users"
end
