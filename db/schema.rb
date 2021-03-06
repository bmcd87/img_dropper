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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131016210958) do

  create_table "album_images", :force => true do |t|
    t.integer  "image_id"
    t.integer  "album_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "album_images", ["image_id", "album_id"], :name => "index_album_images_on_image_id_and_album_id", :unique => true

  create_table "albums", :force => true do |t|
    t.string   "title",      :null => false
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "albums", ["user_id"], :name => "index_albums_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "body",              :null => false
    t.integer  "user_id",           :null => false
    t.integer  "parent_comment_id"
    t.integer  "image_id",          :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "comments", ["image_id"], :name => "index_comments_on_image_id"
  add_index "comments", ["parent_comment_id"], :name => "index_comments_on_parent_comment_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "images", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_remote_url"
    t.string   "authorization_token"
  end

  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "password_resets", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "token",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "password_resets", ["slug"], :name => "index_password_resets_on_slug", :unique => true
  add_index "password_resets", ["user_id", "token"], :name => "index_password_resets_on_user_id_and_token"

  create_table "sessions", :force => true do |t|
    t.string   "session_token", :null => false
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "sessions", ["user_id", "session_token"], :name => "index_sessions_on_user_id_and_session_token", :unique => true

  create_table "user_comment_votes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "comment_id", :null => false
    t.integer  "vote",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_comment_votes", ["user_id", "comment_id"], :name => "index_user_comment_votes_on_user_id_and_comment_id", :unique => true

  create_table "user_image_votes", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "image_id",   :null => false
    t.integer  "vote",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_image_votes", ["user_id", "image_id"], :name => "index_user_image_votes_on_user_id_and_image_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
