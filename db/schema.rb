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

ActiveRecord::Schema.define(version: 2019_04_09_020229) do

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

end
