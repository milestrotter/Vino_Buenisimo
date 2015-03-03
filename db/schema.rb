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

ActiveRecord::Schema.define(version: 20150210214341) do

  create_table "cellars", force: true do |t|
    t.string   "classification"
    t.integer  "size"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "cellars", ["user_id"], name: "index_cellars_on_user_id"

  create_table "conversations", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "messages", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "user_conversations", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.boolean  "read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_conversations", ["conversation_id"], name: "index_user_conversations_on_conversation_id"
  add_index "user_conversations", ["user_id"], name: "index_user_conversations_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wine_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wine_cellars", force: true do |t|
    t.integer  "cellar_id"
    t.integer  "wine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wine_cellars", ["cellar_id"], name: "index_wine_cellars_on_cellar_id"
  add_index "wine_cellars", ["wine_id"], name: "index_wine_cellars_on_wine_id"

  create_table "wine_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wines", force: true do |t|
    t.string   "winery"
    t.integer  "year"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "wine_type_id"
    t.integer  "wine_category_id"
  end

  add_index "wines", ["wine_category_id"], name: "index_wines_on_wine_category_id"
  add_index "wines", ["wine_type_id"], name: "index_wines_on_wine_type_id"

end
