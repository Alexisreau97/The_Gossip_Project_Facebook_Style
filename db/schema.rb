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

ActiveRecord::Schema.define(version: 2018_10_31_143352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.string "anonymous_commentor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gossips", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "anonymous_goossiper"
    t.bigint "user_id"
    t.bigint "comment_id"
    t.bigint "like_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_gossips_on_comment_id"
    t.index ["like_id"], name: "index_gossips_on_like_id"
    t.index ["tag_id"], name: "index_gossips_on_tag_id"
    t.index ["user_id"], name: "index_gossips_on_user_id"
  end

  create_table "gossips_tags", id: false, force: :cascade do |t|
    t.bigint "gossip_id", null: false
    t.bigint "tag_id", null: false
    t.index ["gossip_id", "tag_id"], name: "index_gossips_tags_on_gossip_id_and_tag_id"
    t.index ["tag_id", "gossip_id"], name: "index_gossips_tags_on_tag_id_and_gossip_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "gossips", "comments"
  add_foreign_key "gossips", "likes"
  add_foreign_key "gossips", "tags"
  add_foreign_key "gossips", "users"
end
