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

ActiveRecord::Schema.define(version: 2020_12_31_061901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string "question", null: false
    t.string "answer", null: false
    t.integer "deck_id", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name", null: false
    t.string "objective"
    t.integer "course_id", null: false
    t.index ["course_id", "name"], name: "index_decks_on_course_id_and_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.string "username", null: false
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
