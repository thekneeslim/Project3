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

ActiveRecord::Schema.define(version: 20161010093455) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id",  null: false
    t.integer "student_id", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.time     "start"
    t.time     "end"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_students", id: false, force: :cascade do |t|
    t.integer "language_id", null: false
    t.integer "student_id",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "github"
    t.string   "site"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects_students", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "student_id", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "linkedin"
    t.string   "github"
    t.string   "website"
    t.integer  "contact"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "admin"
    t.integer  "event_id"
    t.index ["event_id"], name: "index_students_on_event_id", using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.string   "title"
    t.date     "start"
    t.date     "end"
    t.text     "description"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "company"
    t.index ["student_id"], name: "index_works_on_student_id", using: :btree
  end

  add_foreign_key "students", "events"
  add_foreign_key "works", "students"
end
