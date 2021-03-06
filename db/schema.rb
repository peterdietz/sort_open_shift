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

ActiveRecord::Schema.define(version: 20171116151640) do

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "employee_id"
    t.string "position"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_employees_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "v2organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "hourOffset"
    t.integer "shiftCount"
    t.integer "recentShifts"
    t.integer "nonRecentShifts"
    t.float "V1SHITS"
    t.integer "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recentRequestShifts"
    t.integer "nonRecentRequestShifts"
    t.integer "recentCallOffs"
    t.integer "nonRecentCallOffs"
    t.integer "recentNoShow"
    t.integer "nonRecentNoShow"
    t.float "V2SHITS"
    t.index ["employee_id"], name: "index_scores_on_employee_id"
  end

end
