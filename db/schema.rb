# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_27_165326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "short_urls", force: :cascade do |t|
    t.string "url"
    t.string "slug"
    t.integer "views_count", default: 0
    t.datetime "created_at"
    t.index ["slug"], name: "index_short_urls_on_slug", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.integer "short_url_id"
    t.string "platform"
    t.string "device"
    t.string "country"
    t.datetime "created_at"
  end

end
