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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_011331) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "classrooms", force: :cascade do |t|
    t.string "identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "homework"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "homework_link"
    t.index ["classroom_id"], name: "index_lessons_on_classroom_id"
  end

  create_table "student_lessons", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "student_id", null: false
    t.boolean "absent"
    t.integer "RC"
    t.integer "CP"
    t.integer "AG"
    t.integer "CM"
    t.integer "AP"
    t.integer "MV"
    t.text "abstract"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_student_lessons_on_lesson_id"
    t.index ["student_id"], name: "index_student_lessons_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "full_name"
    t.string "responsible"
    t.string "email"
    t.date "birthdate"
    t.string "username"
    t.bigint "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_students_on_classroom_id"
  end

  add_foreign_key "lessons", "classrooms"
  add_foreign_key "student_lessons", "lessons"
  add_foreign_key "student_lessons", "students"
  add_foreign_key "students", "classrooms"
end
