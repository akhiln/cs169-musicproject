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

ActiveRecord::Schema.define(:version => 20101119040017) do

  create_table "playlist_comments", :force => true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "playlist_id"
    t.integer  "user_id"
  end

  create_table "playlists", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.float    "rating"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlistsongs", :id => false, :force => true do |t|
    t.integer  "playlist_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "song_comments", :force => true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "song_id"
    t.integer  "user_id"
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
    t.string   "login",                         :limit => 40
    t.string   "name",                          :limit => 100, :default => ""
    t.string   "email",                         :limit => 100
    t.string   "crypted_password",              :limit => 128, :default => "",   :null => false
    t.string   "password_salt",                 :limit => 128, :default => "",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "old_remember_token",            :limit => 40
    t.datetime "old_remember_token_expires_at"
    t.string   "pic"
    t.string   "bio"
    t.string   "password_reset_code"
    t.string   "activation_code"
    t.integer  "login_count",                                  :default => 0,    :null => false
    t.integer  "failed_login_count",                           :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.boolean  "active",                                       :default => true, :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

  create_table "usersongs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
