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

ActiveRecord::Schema.define(:version => 20121205221858) do

  create_table "auctions", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.decimal  "price"
    t.string   "product"
    t.string   "seller_name"
    t.string   "baseinfo"
    t.string   "highestBidderEmail"
    t.integer  "days"
    t.integer  "hours"
    t.datetime "end_time"
    t.integer  "user_id"
    t.string   "status"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "auctions", ["user_id", "created_at"], :name => "index_auctions_on_user_id_and_created_at"

  create_table "bid_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "watch_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
