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
    t.string   "auth_token"
    t.string   "display_name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.integer  "status"
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
    t.integer  "accounts_id"
    t.integer  "agencies_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gera_accounts", force: true do |t|
    t.integer  "accounts_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_accounts", force: true do |t|
    t.integer  "account_id",              null: false
    t.integer  "merchant_id",             null: false
    t.string   "name",                    null: false
    t.integer  "role_id",     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_branches", force: true do |t|
    t.integer  "merchant_id", null: false
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_dondathangs", force: true do |t|
    t.integer  "warehouse_product_chitiets_id",                          null: false
    t.integer  "merchant_dondathang_id",                                 null: false
    t.integer  "qualtity",                                               null: false
    t.decimal  "price",                         precision: 10, scale: 0, null: false
    t.decimal  "giamgia",                       precision: 10, scale: 0, null: false
    t.string   "tinhtrang",                                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_donhangs", force: true do |t|
    t.integer  "merchant_dondathang_id",                                      null: false
    t.integer  "product_code",                                                null: false
    t.integer  "skull_code",                                                  null: false
    t.integer  "qualtity",                                                    null: false
    t.integer  "qualtity_soluongtra",                             default: 0, null: false
    t.decimal  "price",                  precision: 10, scale: 0,             null: false
    t.decimal  "giamgia",                precision: 10, scale: 0,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_kiemtons", force: true do |t|
    t.integer  "warehouse_product_chitiets_id", null: false
    t.integer  "merchant_kiemton_receipe_id",   null: false
    t.integer  "qualtity",                      null: false
    t.integer  "qualtity_thucte",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_trahangs", force: true do |t|
    t.integer  "merchant_chitiet_trahang_id",   null: false
    t.integer  "warehouse_product_chitiets_id", null: false
    t.integer  "qualtity",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_customer_mackay_profiles", force: true do |t|
    t.integer  "merchant_customer_id"
    t.string   "m1_1"
    t.string   "m1_2"
    t.string   "m1_3"
    t.string   "m2_1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_customers", force: true do |t|
    t.integer  "merchant_id"
    t.string   "account_name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_dondathangs", force: true do |t|
    t.integer  "merchant_warehouse_id",                                      null: false
    t.datetime "date_dat",                                                   null: false
    t.datetime "date_giao",                                                  null: false
    t.integer  "create_id",                                                  null: false
    t.integer  "nguoimua_id",                                                null: false
    t.string   "diachigiao",                                                 null: false
    t.string   "tennguoinhan",                                               null: false
    t.string   "sdt",                                                        null: false
    t.decimal  "all_money",             precision: 10, scale: 0,             null: false
    t.decimal  "giamgia",               precision: 10, scale: 0, default: 0, null: false
    t.decimal  "khuyenmaitienmat",      precision: 10, scale: 0, default: 0, null: false
    t.integer  "pttt",                                                       null: false
    t.decimal  "money_tratruoc",        precision: 10, scale: 0, default: 0, null: false
    t.integer  "tinhtrangdonhang",                               default: 0, null: false
    t.integer  "trahang",                                        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_import_receipes", force: true do |t|
    t.integer  "merchant_warehouse_id", null: false
    t.integer  "warehouse_id_xuat",     null: false
    t.text     "description",           null: false
    t.integer  "create_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_kiemton_receipes", force: true do |t|
    t.integer  "merchant_warehouse_id", null: false
    t.text     "decription",            null: false
    t.integer  "create_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_phieugiaohangs", force: true do |t|
    t.integer  "merchant_dondathang_id",                          null: false
    t.datetime "date_giao",                                       null: false
    t.integer  "nguoigiao_id",                                    null: false
    t.string   "tennguoinhan",                                    null: false
    t.text     "diachi",                                          null: false
    t.decimal  "all_money",              precision: 10, scale: 0, null: false
    t.decimal  "tratruoc",               precision: 10, scale: 0, null: false
    t.decimal  "phivanchuyen",           precision: 10, scale: 0, null: false
    t.text     "ghichu",                                          null: false
    t.integer  "trangthai",                                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_providers", force: true do |t|
    t.integer  "merchant_id", null: false
    t.string   "name",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_skulls", force: true do |t|
    t.integer  "merchant_id", null: false
    t.string   "skull_code",  null: false
    t.string   "description"
    t.integer  "create_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_trahangs", force: true do |t|
    t.integer  "merchant_dondathang_id", null: false
    t.datetime "date_trahang",           null: false
    t.text     "lydo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_warehouse_products", force: true do |t|
    t.string   "product_code",                                null: false
    t.string   "skull_code",                                  null: false
    t.integer  "merchant_warehouse",                          null: false
    t.string   "name",                                        null: false
    t.integer  "qualtiy_all",                                 null: false
    t.decimal  "price",              precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_warehouses", force: true do |t|
    t.integer  "merchant_branche_id", null: false
    t.string   "name",                null: false
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_xuat_histories", force: true do |t|
    t.integer  "merchant_xuat_receipe_id",      null: false
    t.integer  "warehouse_product_chitiets_id", null: false
    t.integer  "qualtity",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_xuat_receipes", force: true do |t|
    t.integer  "merchant_warehouse_id", null: false
    t.integer  "warehouse_id_nhan",     null: false
    t.integer  "create_id",             null: false
    t.text     "description",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.integer  "headquater", null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warehouse_product_chitiets", force: true do |t|
    t.string   "product_code",                                        null: false
    t.integer  "merchant_skull_id",                                   null: false
    t.integer  "merchant_provider_id",                                null: false
    t.integer  "merchant_import_receipe_id",                          null: false
    t.integer  "merchant_warehouses_id",                              null: false
    t.string   "name",                                                null: false
    t.integer  "qualtity",                                            null: false
    t.integer  "qualtity_khadi",                                      null: false
    t.integer  "qualtity_ton",                                        null: false
    t.decimal  "price",                      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
