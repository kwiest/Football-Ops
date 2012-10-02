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

ActiveRecord::Schema.define(:version => 20121002203715) do

  create_table "apps", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.string   "website"
    t.string   "redirect_uri"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "api_key"
    t.string   "api_key_secret"
  end

  create_table "authorization_codes", :force => true do |t|
    t.integer  "app_id"
    t.string   "code"
    t.string   "expires_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "conferences", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "category"
    t.text     "description"
    t.text     "apply"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "school"
  end

  create_table "schools", :force => true do |t|
    t.integer  "conference_id"
    t.integer  "district_id"
    t.integer  "division_id"
    t.string   "name"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", :force => true do |t|
    t.string   "name"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.integer  "school_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.string   "phone"
    t.string   "fax"
    t.boolean  "conference_rep"
    t.boolean  "national_committee"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.tsvector "search"
  end

  add_index "users", ["search"], :name => "users_search_index"

end
