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

ActiveRecord::Schema.define(version: 20130715102817) do

  create_table "flickr_photos", force: true do |t|
    t.string   "ownername"
    t.string   "photo_url"
    t.datetime "date_added"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photoid"
  end

  create_table "new_items", force: true do |t|
    t.string   "itemtype"
    t.string   "itemid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: true do |t|
    t.string   "name"
    t.integer  "value"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.string   "tweetid"
    t.string   "name"
    t.string   "screen_name"
    t.text     "tweet_text"
    t.string   "media_url"
    t.string   "profile_image_url"
    t.datetime "tweeted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "youtube_videos", force: true do |t|
    t.string   "videoid"
    t.string   "videourl"
    t.string   "authorname"
    t.datetime "dateuploaded"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
