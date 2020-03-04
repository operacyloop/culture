create_table "employee", force: :cascade do |t|
    t.string  "name_of_employee"
    t.text    "details_about_employee"
    t.string "attribute"
    t.integer "user_id"
  end

  Attribute/Characteristic table
  rating -> integer