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

ActiveRecord::Schema.define(version: 20161107053236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
  end

  create_table "complaints", force: :cascade do |t|
    t.time     "date"
    t.float    "amt_total"
    t.time     "closing_date"
    t.integer  "customer_id"
    t.integer  "system_id"
    t.string   "complaint_status", default: "new"
    t.boolean  "suspended",        default: false
    t.string   "reason"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["customer_id"], name: "index_complaints_on_customer_id", using: :btree
    t.index ["system_id"], name: "index_complaints_on_system_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "number"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_contacts_on_customer_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "eid"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["customer_id"], name: "index_emails_on_customer_id", using: :btree
  end

  create_table "models", force: :cascade do |t|
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
    t.index ["email"], name: "index_models_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.date     "date"
    t.string   "mode",           default: "cash"
    t.string   "check_no"
    t.float    "amt_received"
    t.string   "payment_status", default: "pending"
    t.date     "next_date"
    t.boolean  "suspended",      default: false
    t.string   "reason"
    t.integer  "complaint_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["complaint_id"], name: "index_payments_on_complaint_id", using: :btree
  end

  create_table "problems", force: :cascade do |t|
    t.string   "issue"
    t.string   "problem_type",   default: "hardware"
    t.string   "priority",       default: "low"
    t.time     "closing_date"
    t.string   "problem_status", default: "new"
    t.boolean  "suspended",      default: false
    t.string   "reason"
    t.integer  "complaint_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["complaint_id"], name: "index_problems_on_complaint_id", using: :btree
  end

  create_table "systems", force: :cascade do |t|
    t.string   "category",    default: "computer"
    t.string   "name"
    t.string   "number",                           null: false
    t.integer  "customer_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["customer_id"], name: "index_systems_on_customer_id", using: :btree
  end

end
