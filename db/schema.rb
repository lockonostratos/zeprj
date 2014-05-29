# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140411100003) do

  create_table "accounts", force: true do |t|
    t.string   "auth_token",                  null: false
    t.integer  "account_type",                null: false
    t.integer  "parent_id",       default: 0
    t.integer  "status",          default: 0
    t.string   "display_name"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email",                       null: false
    t.string   "phone"
    t.string   "password_digest",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agencies", force: true do |t|
    t.string   "name"
    t.integer  "headquater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agency_accounts", force: true do |t|
    t.integer  "account_id"
    t.integer  "agency_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", force: true do |t|
    t.integer  "merchant_id",         null: false
    t.integer  "merchant_account_id", null: false
    t.string   "name",                null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches", force: true do |t|
    t.integer  "merchant_id", null: false
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "merchant_id",         null: false
    t.integer  "merchant_account_id", null: false
    t.integer  "area_id"
    t.string   "account_name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: true do |t|
    t.integer  "order_id",                                                    null: false
    t.integer  "merchant_account_id",                                         null: false
    t.boolean  "success",                                      default: true
    t.datetime "creation_date",                                               null: false
    t.datetime "delivery_date",                                               null: false
    t.string   "delivery_address",                                            null: false
    t.string   "contact_name",                                                null: false
    t.string   "contact_phone",                                               null: false
    t.decimal  "transportation_fee",  precision: 10, scale: 0,                null: false
    t.string   "comment",                                                     null: false
    t.integer  "status",                                                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "export_details", force: true do |t|
    t.integer  "export_id",  null: false
    t.integer  "product_id", null: false
    t.integer  "quality",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exports", force: true do |t|
    t.integer  "merchant_account_id", null: false
    t.integer  "warehouse_id",        null: false
    t.integer  "target_warehouse_id"
    t.text     "description",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gera_accounts", force: true do |t|
    t.integer  "account_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imports", force: true do |t|
    t.integer  "warehouse_id",        null: false
    t.integer  "merchant_account_id", null: false
    t.integer  "export"
    t.text     "description",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.integer  "warehouse_id",                        null: false
    t.integer  "merchant_account_id",                 null: false
    t.boolean  "submited",            default: false
    t.text     "decription"
    t.boolean  "success",             default: false, null: false
    t.boolean  "resolved",            default: false, null: false
    t.text     "resolve_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_details", force: true do |t|
    t.integer  "product_id",                          null: false
    t.integer  "inventory_id",                        null: false
    t.integer  "original_quality",                    null: false
    t.integer  "real_quality",                        null: false
    t.integer  "sale_quality",                        null: false
    t.integer  "lost_quality",        default: 0
    t.string   "resolve_description"
    t.boolean  "resolved",            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mackay_and_companies", force: true do |t|
    t.integer "mackay_profile_id"
    t.string  "ethic_cautious"
    t.boolean "customer_feel_obligation"
    t.string  "obligation_descriptions"
    t.boolean "very_focus"
    t.boolean "very_ethic"
    t.string  "customer_key_aspect"
  end

  create_table "mackay_careers", force: true do |t|
    t.integer "mackay_profile_id"
    t.string  "last_company_name"
    t.string  "last_company_address"
    t.string  "last_position"
    t.date    "last_start_working_date"
    t.string  "current_position"
    t.string  "comany_award"
    t.string  "company_atitude"
    t.string  "short_term_career_plan"
    t.string  "long_term_career_plan"
    t.string  "current_concerns"
    t.string  "relation_with_our_staffs"
    t.string  "relation_status"
    t.string  "relation_description"
    t.string  "relation_essense"
  end

  create_table "mackay_childrens", force: true do |t|
    t.integer "mackay_profile_id"
    t.string  "first_name"
    t.string  "last_name"
    t.integer "gender"
    t.string  "education"
    t.integer "age"
    t.string  "hobbies"
    t.text    "comment"
  end

  create_table "mackay_educations", force: true do |t|
    t.integer "mackay_profile_id"
    t.string  "high_school_name"
    t.date    "high_school_year"
    t.string  "university_name"
    t.date    "university_start_year"
    t.date    "university_graduate_year"
    t.string  "graduation_grade"
    t.string  "university_award"
    t.string  "university_club"
    t.string  "sports"
    t.string  "activities"
    t.text    "feeling_university"
    t.string  "alternative"
    t.string  "army_name"
    t.string  "army_grade"
    t.string  "army_atitude"
  end

  create_table "mackay_families", force: true do |t|
    t.integer "mackay_profile_id"
    t.integer "mariage_status"
    t.string  "spouse_name"
    t.string  "spouse_education"
    t.string  "spouse_hobbies"
    t.date    "mariage_at"
  end

  create_table "mackay_hobbies", force: true do |t|
    t.integer "mackay_profile_id"
    t.string  "club_name"
    t.string  "community_activity"
    t.string  "religious"
    t.string  "conversation_avoids"
    t.string  "conversation_enjoy"
  end

  create_table "mackay_life_styles", force: true do |t|
    t.integer "mackay_profile_id"
    t.string  "sickness_history"
    t.string  "current_heath_status"
    t.boolean "enjoy_drink"
    t.string  "famous_drink"
    t.string  "drink_tolarence"
    t.boolean "dislike_drink"
    t.boolean "smoke"
    t.string  "dislike_smoke"
    t.string  "famous_lunch_restaurant"
    t.string  "famous_diner_restaurant"
    t.string  "famous_dishes"
    t.boolean "hate_feed"
    t.string  "hoobies"
    t.string  "entertainment_hobbies"
    t.string  "reading_hoobies"
    t.string  "holiday_hobbies"
    t.string  "famous_sports"
    t.string  "targeted_object"
    t.string  "expected_from_object"
    t.string  "adjectives_about_customer"
    t.string  "best_prounds"
    t.string  "long_term_target"
    t.string  "short_term_target"
  end

  create_table "mackay_personals", force: true do |t|
    t.integer "mackay_profile_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "position"
    t.string  "company_name"
    t.string  "company_address"
    t.string  "company_phone"
    t.string  "home_address"
    t.string  "home_phone"
    t.string  "date_of_birth"
    t.string  "place_of_birth"
    t.string  "home_town"
    t.integer "gender"
    t.integer "height"
    t.integer "weight"
    t.text    "comment"
  end

  create_table "mackay_profiles", force: true do |t|
    t.integer  "customer_id"
    t.integer  "last_updator_id", null: false
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_account_permission_details", force: true do |t|
    t.integer  "merchant_account_id"
    t.integer  "role_id"
    t.string   "permission_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_account_roles", force: true do |t|
    t.integer  "merchant_account_id"
    t.integer  "role_id"
    t.text     "permission_text"
    t.text     "warehouse_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_accounts", force: true do |t|
    t.integer  "account_id",                       null: false
    t.integer  "merchant_id",                      null: false
    t.integer  "branch_id",            default: 0, null: false
    t.integer  "current_warehouse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.integer  "headquater_id", default: 0, null: false
    t.integer  "owner_id",                  null: false
    t.string   "name",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metro_summaries", force: true do |t|
    t.integer "warehouse_id"
    t.integer "product_count",                default: 0
    t.integer "stock_count",                  default: 0
    t.integer "customer_count",               default: 0
    t.integer "staff_count",                  default: 0
    t.integer "staff_count_branch",           default: 0
    t.integer "sale_count",                   default: 0
    t.integer "sale_count_day",               default: 0
    t.integer "sale_count_month",             default: 0
    t.integer "return_count",                 default: 0
    t.integer "return_count_day",             default: 0
    t.integer "return_count_month",           default: 0
    t.integer "revenue",            limit: 8, default: 0
    t.integer "revenue_day",        limit: 8, default: 0
    t.integer "revenue_month",      limit: 8, default: 0
  end

  create_table "modules", force: true do |t|
    t.string   "name"
    t.integer  "type"
    t.boolean  "show"
    t.boolean  "create"
    t.boolean  "edit"
    t.boolean  "delete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_details", force: true do |t|
    t.integer  "order_id",                                            null: false
    t.integer  "product_id",                                          null: false
    t.integer  "quality",                                             null: false
    t.integer  "return_quality",                          default: 0, null: false
    t.decimal  "price",          precision: 10, scale: 0,             null: false
    t.decimal  "discount_cash",  precision: 10, scale: 0, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "branch_id",                                                    null: false
    t.integer  "warehouse_id",                                                 null: false
    t.integer  "merchant_account_id",                                          null: false
    t.integer  "customer_id",                                                  null: false
    t.boolean  "return",                                       default: false, null: false
    t.boolean  "delivery",                                     default: false, null: false
    t.decimal  "total_price",         precision: 10, scale: 0,                 null: false
    t.decimal  "deposit",             precision: 10, scale: 0, default: 0,     null: false
    t.decimal  "discount_cash",       precision: 10, scale: 0, default: 0,     null: false
    t.decimal  "final_price",         precision: 10, scale: 0, default: 0,     null: false
    t.integer  "payment_method",                                               null: false
    t.integer  "status",                                       default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permission_details", force: true do |t|
    t.integer  "permission_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.string   "permission_key"
    t.string   "permission_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_summaries", force: true do |t|
    t.string   "product_code",                                             null: false
    t.integer  "skull_id"
    t.integer  "warehouse_id",                                             null: false
    t.integer  "merchant_account_id",                                      null: false
    t.string   "name",                                                     null: false
    t.integer  "quality",                                      default: 0
    t.decimal  "price",               precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "product_code",                                           null: false
    t.integer  "skull_id"
    t.integer  "provider_id",                                            null: false
    t.integer  "warehouse_id",                                           null: false
    t.integer  "import_id",                                              null: false
    t.string   "name",                                                   null: false
    t.integer  "import_quality",                                         null: false
    t.integer  "available_quality",                          default: 0, null: false
    t.integer  "instock_quality",                            default: 0, null: false
    t.decimal  "import_price",      precision: 10, scale: 0
    t.datetime "expire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.integer  "merchant_id", null: false
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "return_details", force: true do |t|
    t.integer  "return_id",                                                  null: false
    t.integer  "return_product_id",                                          null: false
    t.integer  "return_quality",                                             null: false
    t.boolean  "type_return",                                default: false
    t.integer  "product_id"
    t.integer  "quality"
    t.decimal  "price",             precision: 10, scale: 0, default: 0
    t.boolean  "submited",                                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "returns", force: true do |t|
    t.integer  "order_id",                                                     null: false
    t.integer  "merchant_account_id",                                          null: false
    t.boolean  "submited",                                     default: false
    t.decimal  "total_return_money",  precision: 10, scale: 0
    t.datetime "creation_date",                                                null: false
    t.string   "comment",                                                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_permissions", force: true do |t|
    t.integer  "role_id"
    t.integer  "permission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_warehouse", force: true do |t|
    t.integer  "role_id"
    t.integer  "warehouse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "role_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skulls", force: true do |t|
    t.integer  "merchant_id",         null: false
    t.integer  "merchant_account_id", null: false
    t.string   "skull_code",          null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temp_inventory_details", force: true do |t|
    t.integer  "product_id",                       null: false
    t.integer  "inventory_id",                     null: false
    t.integer  "original_quality",                 null: false
    t.integer  "real_quality",     default: 0,     null: false
    t.integer  "quality"
    t.boolean  "submited",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temp_products", force: true do |t|
    t.string   "product_code",                                             null: false
    t.integer  "skull_id"
    t.integer  "provider_id"
    t.integer  "warehouse_id",                                             null: false
    t.integer  "merchant_account_id",                                      null: false
    t.string   "name",                                                     null: false
    t.integer  "import_quality",                               default: 0
    t.decimal  "import_price",        precision: 10, scale: 0
    t.datetime "expire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warehouses", force: true do |t|
    t.integer  "branch_id",  null: false
    t.string   "name",       null: false
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
