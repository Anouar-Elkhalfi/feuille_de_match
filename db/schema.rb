# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_07_06_195540) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "championships", force: :cascade do |t|
    t.string "name"
    t.bigint "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_championships_on_season_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.bigint "championship_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["championship_id"], name: "index_divisions_on_championship_id"
  end

  create_table "injuries", force: :cascade do |t|
    t.bigint "match_participation_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_participation_id"], name: "index_injuries_on_match_participation_id"
  end

  create_table "match_participations", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "player_id", null: false
    t.boolean "captain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_match_participations_on_match_id"
    t.index ["player_id"], name: "index_match_participations_on_player_id"
  end

  create_table "matches", force: :cascade do |t|
    t.date "date"
    t.time "kickoff_time"
    t.string "stadium"
    t.integer "home_score"
    t.integer "away_score"
    t.bigint "home_club_id", null: false
    t.bigint "away_club_id", null: false
    t.bigint "referee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "division_id"
    t.text "pre_match_claims"
    t.text "post_match_claims"
    t.boolean "report_submitted"
    t.boolean "home_signature"
    t.boolean "away_signature"
    t.integer "match_day"
    t.index ["away_club_id"], name: "index_matches_on_away_club_id"
    t.index ["division_id"], name: "index_matches_on_division_id"
    t.index ["home_club_id"], name: "index_matches_on_home_club_id"
    t.index ["referee_id"], name: "index_matches_on_referee_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "license_number"
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_players_on_club_id"
  end

  create_table "red_cards", force: :cascade do |t|
    t.bigint "match_participation_id", null: false
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_participation_id"], name: "index_red_cards_on_match_participation_id"
  end

  create_table "referees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "license_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yellow_cards", force: :cascade do |t|
    t.bigint "match_participation_id", null: false
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_participation_id"], name: "index_yellow_cards_on_match_participation_id"
  end

  add_foreign_key "championships", "seasons"
  add_foreign_key "divisions", "championships"
  add_foreign_key "injuries", "match_participations"
  add_foreign_key "match_participations", "matches"
  add_foreign_key "match_participations", "players"
  add_foreign_key "matches", "clubs", column: "away_club_id"
  add_foreign_key "matches", "clubs", column: "home_club_id"
  add_foreign_key "matches", "divisions"
  add_foreign_key "matches", "referees"
  add_foreign_key "players", "clubs"
  add_foreign_key "red_cards", "match_participations"
  add_foreign_key "yellow_cards", "match_participations"
end
