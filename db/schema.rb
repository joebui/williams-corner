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

ActiveRecord::Schema.define(version: 20150516041452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "is_admin",          default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "language",          default: "en"
    t.boolean  "valid_coupon",      default: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.string   "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "account_id"
    t.integer  "owner_id"
    t.integer  "unit_price"
    t.integer  "quantity"
    t.string   "total_price"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "status"
    t.float    "discount"
    t.boolean  "hide",        default: false
    t.date     "tran_date",   default: '2015-10-08'
  end

  add_index "order_items", ["account_id"], name: "index_order_items_on_account_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "des"
    t.string   "img"
    t.string   "genre"
    t.string   "price"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "viewed",     default: 0
    t.string   "link"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "account_id"
    t.string   "stars"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["product_id"], name: "index_ratings_on_product_id", using: :btree

  add_foreign_key "order_items", "accounts"
  add_foreign_key "order_items", "products"
end
