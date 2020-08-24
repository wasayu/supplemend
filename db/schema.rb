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

ActiveRecord::Schema.define(version: 2020_08_16_061812) do

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "supplement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplement_id"], name: "index_favorites_on_supplement_id"
    t.index ["user_id", "supplement_id"], name: "index_favorites_on_user_id_and_supplement_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "flavor_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "suggestion_id"
    t.boolean "saving", default: false, null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suggestion_id"], name: "index_menus_on_suggestion_id"
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "suggest_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "supplement_id"
    t.bigint "suggestion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["suggestion_id"], name: "index_suggest_details_on_suggestion_id"
    t.index ["supplement_id"], name: "index_suggest_details_on_supplement_id"
  end

  create_table "suggestions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.string "purpose"
    t.integer "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppl_flavors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "supplement_id"
    t.bigint "flavor_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flavor_tag_id"], name: "index_suppl_flavors_on_flavor_tag_id"
    t.index ["supplement_id", "flavor_tag_id"], name: "index_suppl_flavors_on_supplement_id_and_flavor_tag_id", unique: true
    t.index ["supplement_id"], name: "index_suppl_flavors_on_supplement_id"
  end

  create_table "suppl_menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "supplement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_suppl_menus_on_menu_id"
    t.index ["supplement_id"], name: "index_suppl_menus_on_supplement_id"
  end

  create_table "suppl_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "supplement_id"
    t.bigint "tag_id"
    t.boolean "primary_tag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplement_id", "primary_tag"], name: "index_suppl_tags_on_supplement_id_and_primary_tag", unique: true
    t.index ["supplement_id", "tag_id"], name: "index_suppl_tags_on_supplement_id_and_tag_id", unique: true
    t.index ["supplement_id"], name: "index_suppl_tags_on_supplement_id"
    t.index ["tag_id"], name: "index_suppl_tags_on_tag_id"
  end

  create_table "supplements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_name"
    t.string "brand"
    t.string "suppl_name"
    t.string "made"
    t.string "flavor"
    t.integer "price"
    t.string "price_tag"
    t.integer "use_time"
    t.integer "calorie"
    t.float "lipid"
    t.float "carbo"
    t.float "protein"
    t.text "img"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorites", "supplements"
  add_foreign_key "favorites", "users"
  add_foreign_key "menus", "suggestions"
  add_foreign_key "menus", "users"
  add_foreign_key "suggest_details", "suggestions"
  add_foreign_key "suggest_details", "supplements"
  add_foreign_key "suppl_flavors", "flavor_tags"
  add_foreign_key "suppl_flavors", "supplements"
  add_foreign_key "suppl_menus", "menus"
  add_foreign_key "suppl_menus", "supplements"
  add_foreign_key "suppl_tags", "supplements"
  add_foreign_key "suppl_tags", "tags"
end
