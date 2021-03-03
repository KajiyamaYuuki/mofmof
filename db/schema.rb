ActiveRecord::Schema.define(version: 2021_03_03_105827) do

  create_table "nearest_stations", force: :cascade do |t|
    t.string "line"
    t.string "station"
    t.string "time"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_nearest_stations_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "rent"
    t.string "adress"
    t.string "age"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
