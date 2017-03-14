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

ActiveRecord::Schema.define(version: 20170314102641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "party_id"
    t.index ["party_id"], name: "index_members_on_party_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.string   "playlistID"
    t.string   "partyID"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.string   "host_id"
    t.boolean  "guest_song_add_state"
    t.boolean  "down_vote_state"
    t.index ["user_id"], name: "index_parties_on_user_id", using: :btree
  end

  create_table "songs", force: :cascade do |t|
    t.string   "songName"
    t.string   "songArtistName"
    t.string   "songID"
    t.string   "imageURL"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "party_id"
    t.index ["party_id"], name: "index_songs_on_party_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "spotify_user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "access_token"
    t.string   "refresh_token"
    t.string   "token_expiration_time"
  end

  add_foreign_key "members", "parties"
  add_foreign_key "parties", "users"
  add_foreign_key "songs", "parties"
end
