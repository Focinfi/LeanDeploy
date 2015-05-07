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

ActiveRecord::Schema.define(version: 20150507103722) do

  create_table "html_descs", force: :cascade do |t|
    t.integer  "place_id",   limit: 4
    t.text     "html_doc",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "html_descs", ["place_id"], name: "index_html_descs_on_place_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "place_id",   limit: 4
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "images", ["place_id"], name: "index_images_on_place_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "latitude",       limit: 255,   default: "32.1119"
    t.string   "longitude",      limit: 255,   default: "118.932"
    t.string   "business_hours", limit: 255
    t.string   "description",    limit: 255
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "picture_01",     limit: 255
    t.integer  "view_times",     limit: 4,     default: 0
    t.string   "author",         limit: 255,   default: "读觅小编"
    t.string   "category",       limit: 255
    t.string   "picture_02",     limit: 255
    t.string   "picture_03",     limit: 255
    t.string   "flag",           limit: 255,   default: "rich"
    t.text     "address",        limit: 65535
    t.text     "contact",        limit: 65535
  end

  add_index "places", ["business_hours"], name: "index_places_on_business_hours", using: :btree
  add_index "places", ["latitude", "longitude"], name: "index_places_on_latitude_and_longitude", using: :btree
  add_index "places", ["name"], name: "index_places_on_name", using: :btree

end
