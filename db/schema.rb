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

ActiveRecord::Schema.define(version: 20151201061444) do

  create_table "boxes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "boxes", ["user_id"], name: "index_boxes_on_user_id"

  create_table "entries", force: :cascade do |t|
    t.text     "body"
    t.integer  "journal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "subject"
  end

  add_index "entries", ["journal_id"], name: "index_entries_on_journal_id"

  create_table "journals", force: :cascade do |t|
    t.string   "title"
    t.integer  "box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "journals", ["box_id"], name: "index_journals_on_box_id"

  create_table "pictures", force: :cascade do |t|
    t.text     "caption"
    t.integer  "box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

  add_index "pictures", ["box_id"], name: "index_pictures_on_box_id"

  create_table "recipients", force: :cascade do |t|
    t.string   "recipient"
    t.string   "email"
    t.date     "DOB"
    t.integer  "user_id"
    t.integer  "box_id"
    t.boolean  "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipients", ["box_id"], name: "index_recipients_on_box_id"
  add_index "recipients", ["user_id"], name: "index_recipients_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "membership",             default: 0
    t.boolean  "subscribed"
    t.string   "stripeid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
