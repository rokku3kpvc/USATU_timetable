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

ActiveRecord::Schema.define(version: 2019_04_03_034748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lecturers", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_courses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_course_id", null: false
    t.index ["student_course_id"], name: "index_student_groups_on_student_course_id"
  end

  create_table "subject_time_periods", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.integer "s_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetable_records", force: :cascade do |t|
    t.integer "subgroup"
    t.date "day_date"
    t.integer "day_of_week"
    t.bigint "subject_time_period_id", null: false
    t.bigint "timetable_id", null: false
    t.bigint "subject_id", null: false
    t.bigint "room_id", null: false
    t.bigint "lecturer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecturer_id"], name: "index_timetable_records_on_lecturer_id"
    t.index ["room_id"], name: "index_timetable_records_on_room_id"
    t.index ["subject_id"], name: "index_timetable_records_on_subject_id"
    t.index ["subject_time_period_id"], name: "index_timetable_records_on_subject_time_period_id"
    t.index ["timetable_id"], name: "index_timetable_records_on_timetable_id"
  end

  create_table "timetable_records_weeks", id: false, force: :cascade do |t|
    t.bigint "week_id", null: false
    t.bigint "timetable_record_id", null: false
    t.index ["timetable_record_id"], name: "index_timetable_records_weeks_on_timetable_record_id"
    t.index ["week_id"], name: "index_timetable_records_weeks_on_week_id"
  end

  create_table "timetables", force: :cascade do |t|
    t.bigint "student_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_group_id"], name: "index_timetables_on_student_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.integer "w_num", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "student_groups", "student_courses"
  add_foreign_key "timetable_records", "lecturers"
  add_foreign_key "timetable_records", "rooms"
  add_foreign_key "timetable_records", "subject_time_periods"
  add_foreign_key "timetable_records", "subjects"
  add_foreign_key "timetable_records", "timetables"
  add_foreign_key "timetables", "student_groups"
end
