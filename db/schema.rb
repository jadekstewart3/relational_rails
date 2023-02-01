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

ActiveRecord::Schema.define(version: 2023_02_01_220249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "climbing_gyms", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "number_of_routes"
    t.boolean "classes_offered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patrons", force: :cascade do |t|
    t.integer "gym_id"
    t.string "name"
    t.boolean "belay_certified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "climbing_gym_id"
    t.index ["climbing_gym_id"], name: "index_patrons_on_climbing_gym_id"
  end

  add_foreign_key "patrons", "climbing_gyms"
end
