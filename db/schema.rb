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

ActiveRecord::Schema.define(version: 20151211204252) do

  create_table "episodes", force: :cascade do |t|
    t.string   "number"
    t.string   "title"
    t.text     "body"
    t.datetime "recorded_at"
    t.datetime "published_at"
    t.string   "image"
    t.string   "media"
    t.integer  "media_length"
    t.integer  "media_size"
    t.integer  "podcast_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "episodes", ["podcast_id"], name: "index_episodes_on_podcast_id"

  create_table "podcasts", force: :cascade do |t|
    t.string   "path"
    t.string   "title"
    t.text     "body"
    t.string   "image"
    t.string   "author"
    t.string   "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
