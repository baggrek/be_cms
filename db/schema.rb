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

ActiveRecord::Schema.define(version: 2019_06_25_182141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.string "airplane_code"
    t.string "airline"
    t.integer "capacity"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_airplanes_on_user_id"
  end

  create_table "cloudflare_domain_details", force: :cascade do |t|
    t.string "sub_domain"
    t.string "pointing"
    t.bigint "cloudflare_domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cloudflare_domain_id"], name: "index_cloudflare_domain_details_on_cloudflare_domain_id"
  end

  create_table "cloudflare_domains", force: :cascade do |t|
    t.string "domain"
    t.string "zone_id"
    t.bigint "cloudflare_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cloudflare_user_id"], name: "index_cloudflare_domains_on_cloudflare_user_id"
  end

  create_table "cloudflare_users", force: :cascade do |t|
    t.string "email"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_cloudflare_users_on_user_id"
  end

  create_table "content_details", force: :cascade do |t|
    t.integer "click"
    t.bigint "airplane_id"
    t.bigint "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_id"], name: "index_content_details_on_airplane_id"
    t.index ["content_id"], name: "index_content_details_on_content_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.string "url_image"
    t.string "url_redirect"
    t.string "description"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.string "first_name"
    t.string "midle_name"
    t.string "last_name"
    t.integer "role", default: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "airplanes", "users"
  add_foreign_key "cloudflare_domain_details", "cloudflare_domains"
  add_foreign_key "cloudflare_domains", "cloudflare_users"
  add_foreign_key "cloudflare_users", "users"
  add_foreign_key "content_details", "airplanes"
  add_foreign_key "content_details", "contents"
  add_foreign_key "contents", "users"
end
