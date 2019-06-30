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

ActiveRecord::Schema.define(version: 2019_06_29_233538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contests", force: :cascade do |t|
    t.string "name"
    t.integer "holding_times"
    t.string "problem_1_name"
    t.text "problem_1"
    t.text "problem_1_answer"
    t.text "submission_limit_1"
    t.text "executing_sample_1"
    t.text "execution_result_1"
    t.text "executing_sample_1_remark"
    t.string "problem_2_name"
    t.text "problem_2"
    t.text "problem_2_answer"
    t.text "submission_limit_2"
    t.text "executing_sample_2"
    t.text "execution_result_2"
    t.text "executing_sample_2_remark"
    t.string "problem_3_name"
    t.text "problem_3"
    t.text "problem_3_answer"
    t.text "submission_limit_3"
    t.text "executing_sample_3"
    t.text "execution_result_3"
    t.text "executing_sample_3_remark"
    t.string "problem_4_name"
    t.text "problem_4"
    t.text "problem_4_answer"
    t.text "submission_limit_4"
    t.text "executing_sample_4"
    t.text "execution_result_4"
    t.text "executing_sample_4_remark"
    t.string "writer"
    t.integer "rating"
    t.integer "penalty"
    t.datetime "start_time"
    t.string "contest_type"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "direct_messages", force: :cascade do |t|
    t.string "message"
    t.integer "user_id"
    t.string "target_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "draft_contests", force: :cascade do |t|
    t.string "name"
    t.integer "holding_times"
    t.string "problem_1_name"
    t.text "problem_1"
    t.text "problem_1_answer"
    t.text "submission_limit_1"
    t.text "executing_sample_1"
    t.text "execution_result_1"
    t.text "executing_sample_1_remark"
    t.string "problem_2_name"
    t.text "problem_2"
    t.text "problem_2_answer"
    t.text "submission_limit_2"
    t.text "executing_sample_2"
    t.text "execution_result_2"
    t.text "executing_sample_2_remark"
    t.string "problem_3_name"
    t.text "problem_3"
    t.text "problem_3_answer"
    t.text "submission_limit_3"
    t.text "executing_sample_3"
    t.text "execution_result_3"
    t.text "executing_sample_3_remark"
    t.string "problem_4_name"
    t.text "problem_4"
    t.text "problem_4_answer"
    t.text "submission_limit_4"
    t.text "executing_sample_4"
    t.text "execution_result_4"
    t.text "executing_sample_4_remark"
    t.string "writer"
    t.integer "rating"
    t.integer "penalty"
    t.datetime "start_time"
    t.string "contest_type"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "info_type"
    t.string "info_target"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_name"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reactioned_id"
    t.string "reactioned_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "authority", default: "general", null: false
    t.text "profile"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reported_value", default: 0
    t.integer "trusted_value", default: 0
    t.boolean "is_test_user", default: false
    t.string "user_id", null: false
    t.string "image_name", default: "default_icon.png"
    t.string "remember_digest"
    t.string "header_image_name", default: "default_header.png"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "microposts", "users"
end
