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

ActiveRecord::Schema.define(version: 2019_10_21_143229) do

  create_table "fight_classes", force: :cascade do |t|
    t.string "type_of_fight"
    t.integer "instructor_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "rank"
  end

  create_table "student_classes", force: :cascade do |t|
    t.integer "student_id"
    t.integer "fight_class_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "rank"
  end

end
