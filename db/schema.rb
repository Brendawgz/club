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

ActiveRecord::Schema.define(version: 20160513211235) do

  create_table "bookings", force: :cascade do |t|
    t.decimal  "cost"
    t.boolean  "payment"
    t.integer  "guests"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "event_id"
  end

  create_table "event_bookings", force: :cascade do |t|
    t.integer "event_id"
    t.integer "booking_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "date"
    t.integer  "capacity"
    t.string   "theme"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "past"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
