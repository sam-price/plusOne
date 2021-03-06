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

ActiveRecord::Schema.define(version: 20170405164809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["recipient_id", "sender_id"], name: "index_conversations_on_recipient_id_and_sender_id", unique: true, using: :btree
  end

  create_table "fitness_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "state",       default: "pending"
    t.datetime "friended_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "goal_id", null: false
    t.index ["user_id", "goal_id"], name: "index_goals_users_on_user_id_and_goal_id", using: :btree
  end

  create_table "gyms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "city_id"
    t.text     "bio"
    t.index ["city_id"], name: "index_gyms_on_city_id", using: :btree
  end

  create_table "gyms_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "gym_id",  null: false
    t.index ["user_id", "gym_id"], name: "index_gyms_users_on_user_id_and_gym_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text    "body"
    t.integer "user_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "moments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "sports"
    t.string   "goals"
    t.string   "gyms"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cities"
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "sport_id", null: false
    t.index ["user_id", "sport_id"], name: "index_sports_users_on_user_id_and_sport_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.jsonb    "settings",               default: {}, null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.integer  "city_id"
    t.text     "bio"
    t.integer  "workout_id"
    t.integer  "fitness_level_id"
    t.integer  "moment_id"
    t.integer  "gender",                 default: 0
    t.index ["city_id"], name: "index_users_on_city_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["fitness_level_id"], name: "index_users_on_fitness_level_id", using: :btree
    t.index ["moment_id"], name: "index_users_on_moment_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["settings"], name: "index_users_on_settings", using: :gin
    t.index ["workout_id"], name: "index_users_on_workout_id", using: :btree
  end

  create_table "workouts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "gyms", "cities"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "fitness_levels"
  add_foreign_key "users", "moments"
  add_foreign_key "users", "workouts"
end
