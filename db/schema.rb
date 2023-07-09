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

ActiveRecord::Schema[7.0].define(version: 2023_07_05_143835) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_accounts_on_type"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "sets"
    t.string "reps"
    t.string "weight"
    t.text "notes"
    t.bigint "workout_day_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_day_id"], name: "index_exercises_on_workout_day_id"
  end

  create_table "invite_tokens", force: :cascade do |t|
    t.string "token", null: false
    t.bigint "trainer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_invite_tokens_on_token"
    t.index ["trainer_id", "token"], name: "index_invite_tokens_on_trainer_id_and_token"
    t.index ["trainer_id"], name: "index_invite_tokens_on_trainer_id"
  end

  create_table "task_records", id: false, force: :cascade do |t|
    t.string "version", null: false
  end

  create_table "trainer_clients", force: :cascade do |t|
    t.bigint "trainer_id", null: false
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id", "client_id"], name: "index_trainer_clients_on_trainer_id_and_client_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_days", force: :cascade do |t|
    t.bigint "workout_week_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "completed_at"
    t.index ["workout_week_id"], name: "index_workout_days_on_workout_week_id"
  end

  create_table "workout_sets", force: :cascade do |t|
    t.integer "weight"
    t.integer "reps"
    t.text "notes"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "warmup", default: false
    t.index ["exercise_id"], name: "index_workout_sets_on_exercise_id"
  end

  create_table "workout_weeks", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "trainer_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id", "client_id"], name: "index_workout_weeks_on_trainer_id_and_client_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "exercises", "workout_days"
  add_foreign_key "invite_tokens", "accounts", column: "trainer_id"
  add_foreign_key "trainer_clients", "accounts", column: "client_id"
  add_foreign_key "trainer_clients", "accounts", column: "trainer_id"
  add_foreign_key "workout_days", "workout_weeks"
  add_foreign_key "workout_sets", "exercises"
  add_foreign_key "workout_weeks", "accounts", column: "client_id"
  add_foreign_key "workout_weeks", "accounts", column: "trainer_id"
end
