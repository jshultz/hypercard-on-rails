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

ActiveRecord::Schema.define(version: 20150101082937) do

  create_table "profile_themes", force: true do |t|
    t.text    "profileTextH1Color"
    t.text    "profileTextTitleColor"
    t.text    "profileTextTaglineColor"
    t.text    "profileMessageBGColor"
    t.integer "profile_id"
    t.text    "profilebgcolor"
  end

  add_index "profile_themes", ["profile_id"], name: "index_profile_themes_on_profile_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "profilebg_file_name"
    t.string   "profilebg_content_type"
    t.integer  "profilebg_file_size"
    t.datetime "profilebg_updated_at"
    t.text     "twitteruser"
    t.text     "facebookuser"
    t.text     "avatar_meta"
    t.text     "profilebg_meta"
    t.text     "profilevideo_meta"
    t.string   "profilevideo_file_name"
    t.string   "profilevideo_content_type"
    t.integer  "profilevideo_file_size"
    t.datetime "profilevideo_updated_at"
    t.text     "title"
    t.text     "tagline"
    t.text     "random"
    t.boolean  "profilebgnophoto"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "facebook_token"
    t.text     "facebook_expires"
  end

  create_table "videos", force: true do |t|
    t.string   "profilevideo_file_name"
    t.string   "profilevideo_content_type"
    t.integer  "profilevideo_file_size"
    t.datetime "profilevideo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "profilevideo_meta"
    t.integer  "user_id"
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

end
