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

ActiveRecord::Schema.define(version: 2019_12_11_005951) do

  create_table "pricings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "sku"
    t.string "rate_code"
    t.string "description"
    t.integer "begin_range"
    t.string "unit"
    t.float "price_per_unit"
    t.datetime "effective_date"
    t.string "location"
    t.string "servicename"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["effective_date"], name: "index_pricings_on_effective_date"
    t.index ["location"], name: "index_pricings_on_location"
    t.index ["rate_code"], name: "index_pricings_on_rate_code"
    t.index ["sku"], name: "index_pricings_on_sku"
  end

end
