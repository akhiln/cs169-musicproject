# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20101102025313) do
=======
ActiveRecord::Schema.define(:version => 20101102022250) do
>>>>>>> 50fb9c0864f097d49b262811d2586fb3a61346c4

  create_table "playlists", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.float    "rating"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlistsong", :id => false, :force => true do |t|
    t.integer  "playlist_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", :force => true do |t|
    t.string   "album"
    t.float    "length"
    t.string   "genre"
    t.text     "description"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "pic"
    t.string   "bio"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

<<<<<<< HEAD
  create_table "usersong", :force => true do |t|
    t.integer  "playlist_id"
=======
  create_table "users_songs", :force => true do |t|
    t.integer  "user_id"
>>>>>>> 50fb9c0864f097d49b262811d2586fb3a61346c4
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
