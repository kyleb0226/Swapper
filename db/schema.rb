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

ActiveRecord::Schema[7.1].define(version: 2024_02_28_233707) do
  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "completed_matches", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.integer "matched_employee_id", null: false
    t.string "match_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_completed_matches_on_employee_id"
    t.index ["matched_employee_id"], name: "index_completed_matches_on_matched_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "company_name"
    t.string "employee_name"
    t.string "job_title"
    t.string "job_code"
    t.integer "current_location_id"
    t.integer "desired_location_id"
    t.integer "seniority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "matched_employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "match_type"
    t.boolean "completed"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.integer "company_id"
  end

  add_foreign_key "completed_matches", "employees"
  add_foreign_key "completed_matches", "matched_employees"
end
