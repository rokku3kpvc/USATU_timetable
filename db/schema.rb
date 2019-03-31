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

ActiveRecord::Schema.define(version: 2019_03_31_150445) do

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

  create_table "student_groups", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject_time_periods", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timetable_records", force: :cascade do |t|
    t.string "weeks"
    t.integer "subgroup"
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

  create_table "timetables", force: :cascade do |t|
    t.bigint "student_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_group_id"], name: "index_timetables_on_student_group_id"
  end

  add_foreign_key "timetable_records", "lecturers"
  add_foreign_key "timetable_records", "rooms"
  add_foreign_key "timetable_records", "subject_time_periods"
  add_foreign_key "timetable_records", "subjects"
  add_foreign_key "timetable_records", "timetables"
  add_foreign_key "timetables", "student_groups"
end
