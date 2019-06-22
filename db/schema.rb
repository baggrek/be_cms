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

ActiveRecord::Schema.define(version: 2019_06_20_173408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cloudflare_domain_details", force: :cascade do |t|
    t.string "sub_domain"
    t.string "pointing"
    t.bigint "cloudflare_domain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type_record"
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
  end

  add_foreign_key "cloudflare_domain_details", "cloudflare_domains"
  add_foreign_key "cloudflare_domains", "cloudflare_users"
end
