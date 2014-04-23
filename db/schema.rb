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

ActiveRecord::Schema.define(version: 20140418070744) do

  create_table "accounts", force: true do |t|
    t.string   "auth_token",      null: false
    t.string   "display_name"
    t.string   "email",           null: false
    t.string   "phone"
    t.string   "password_digest", null: false
    t.integer  "account_type",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "parent_id"
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

  create_table "branches", force: true do |t|
    t.integer  "merchant_id", null: false
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.integer  "merchant_id"
    t.integer  "merchant_account_id"
    t.string   "account_name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: true do |t|
    t.integer  "order_id",                                     null: false
    t.integer  "merchant_account_id",                          null: false
    t.datetime "delivery_date",                                null: false
    t.decimal  "transportation_fee",  precision: 10, scale: 0, null: false
    t.string   "comment",                                      null: false
    t.integer  "status",                                       null: false
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
    t.integer  "warehouse_id", null: false
    t.text     "description",  null: false
    t.integer  "create_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.integer  "warehouse_id",        null: false
    t.integer  "merchant_account_id", null: false
    t.text     "decription",          null: false
    t.boolean  "success",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_details", force: true do |t|
    t.integer  "product_id",       null: false
    t.integer  "inventory_id",     null: false
    t.integer  "original_quality", null: false
    t.integer  "real_quality",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mackay_profiles", force: true do |t|
    t.integer  "merchant_customer_id"
    t.string   "m1_1"
    t.string   "m1_2"
    t.string   "m1_3"
    t.string   "m2_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_accounts", force: true do |t|
    t.integer  "account_id",                       null: false
    t.integer  "merchant_id",                      null: false
    t.integer  "branch_id",            default: 0, null: false
    t.integer  "current_warehouse_id"
    t.integer  "role_id",              default: 0, null: false
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

  create_table "order_details", force: true do |t|
    t.integer  "order_id",                                            null: false
    t.integer  "product_id",                                          null: false
    t.integer  "quality",                                             null: false
    t.integer  "return_quality",                          default: 0, null: false
    t.decimal  "price",          precision: 10, scale: 0,             null: false
    t.decimal  "discount_cash",  precision: 10, scale: 0,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "branch_id",                                                null: false
    t.integer  "warehouse_id",                                             null: false
    t.integer  "merchant_account_id",                                      null: false
    t.integer  "customer_id",                                              null: false
    t.integer  "return_id",                                    default: 0, null: false
    t.datetime "creation_date",                                            null: false
    t.datetime "delivery_date",                                            null: false
    t.string   "delivery_address",                                         null: false
    t.string   "contact_name",                                             null: false
    t.string   "contact_phone",                                            null: false
    t.decimal  "total_price",         precision: 10, scale: 0,             null: false
    t.decimal  "deposit",             precision: 10, scale: 0,             null: false
    t.decimal  "discount_cash",       precision: 10, scale: 0, default: 0, null: false
    t.decimal  "final_price",         precision: 10, scale: 0,             null: false
    t.integer  "payment_method",                                           null: false
    t.integer  "status",                                       default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_summaries", force: true do |t|
    t.string   "product_code",                                      null: false
    t.integer  "skull_id",                              default: 0, null: false
    t.integer  "warehouse_id",                                      null: false
    t.string   "name",                                              null: false
    t.integer  "qualtiy",                                           null: false
    t.decimal  "price",        precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "product_code",                                           null: false
    t.integer  "skull_id",                                   default: 0, null: false
    t.integer  "provider_id",                                            null: false
    t.integer  "warehouse_id",                                           null: false
    t.integer  "import_id",                                              null: false
    t.string   "name",                                                   null: false
    t.integer  "import_quality",                                         null: false
    t.integer  "available_quality",                                      null: false
    t.integer  "instock_quality",                                        null: false
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
    t.integer  "return_id",       null: false
    t.integer  "product_id",      null: false
    t.integer  "current_quality", null: false
    t.integer  "return_quality",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "returns", force: true do |t|
    t.integer  "order_id",            null: false
    t.integer  "merchant_account_id", null: false
    t.datetime "creation_date",       null: false
    t.string   "comment",             null: false
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

  create_table "warehouses", force: true do |t|
    t.integer  "branch_id",  null: false
    t.string   "name",       null: false
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
