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

ActiveRecord::Schema.define(version: 2018_09_20_141130) do

  create_table "approval_comments", force: :cascade do |t|
    t.integer "request_id", null: false
    t.integer "user_id", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_approval_comments_on_request_id"
    t.index ["user_id"], name: "index_approval_comments_on_user_id"
  end

  create_table "approval_items", force: :cascade do |t|
    t.integer "request_id", null: false
    t.integer "resource_id"
    t.string "resource_type", null: false
    t.string "event", null: false
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_approval_items_on_request_id"
    t.index ["resource_id", "resource_type"], name: "index_approval_items_on_resource_id_and_resource_type"
  end

  create_table "approval_requests", force: :cascade do |t|
    t.integer "request_user_id", null: false
    t.integer "respond_user_id"
    t.integer "state", limit: 1, default: 0, null: false
    t.datetime "requested_at", null: false
    t.datetime "cancelled_at"
    t.datetime "approved_at"
    t.datetime "rejected_at"
    t.datetime "executed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_user_id"], name: "index_approval_requests_on_request_user_id"
    t.index ["respond_user_id"], name: "index_approval_requests_on_respond_user_id"
    t.index ["state"], name: "index_approval_requests_on_state"
  end

  create_table "articles", force: :cascade do |t|
    t.integer "category_id"
    t.string "title"
    t.string "lien"
    t.string "image_url"
    t.string "icon_url"
    t.string "description"
    t.string "tuto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pending_articles", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "lien"
    t.string "image_url"
    t.string "icon_url"
    t.string "description"
    t.string "tuto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_pending_articles_on_category_id"
    t.index ["user_id"], name: "index_pending_articles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reputation"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
