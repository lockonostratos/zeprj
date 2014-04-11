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

ActiveRecord::Schema.define(version: 20140411033436) do

  create_table "accounts", force: true do |t|
    t.string   "auth_token"
    t.string   "display_name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_branches", force: true do |t|
    t.integer  "merchant_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_acounts", force: true do |t|
    t.integer  "merchant_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_dondathangs", force: true do |t|
    t.integer  "merchant_product_chitiet_id"
    t.integer  "merchant_dondathang_id"
    t.integer  "qualtity"
    t.integer  "price"
    t.integer  "giamgia"
    t.string   "tinhtrang"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_donhangs", force: true do |t|
    t.integer  "merchant_dondathang_id"
    t.integer  "product_code"
    t.integer  "skull_code"
    t.integer  "qualtity"
    t.integer  "qualtity_soluongtra"
    t.integer  "price"
    t.integer  "giamgia"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_kiemtons", force: true do |t|
    t.integer  "merchant_product_chitiet_id"
    t.integer  "merchant_kiemton_receipe_id"
    t.integer  "qualtity"
    t.integer  "qualtity_thucte"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_chitiet_trahangs", force: true do |t|
    t.integer  "merchant_chitiet_trahang_id"
    t.integer  "merchant_product_chitiet_id"
    t.integer  "qualtity"
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
    t.integer  "merchant_warehouse_id"
    t.datetime "date_dat"
    t.datetime "date_giao"
    t.integer  "create_id"
    t.integer  "nguoimua_id"
    t.string   "diachigiao"
    t.string   "tennguoinhan"
    t.string   "sdt"
    t.integer  "all_money"
    t.integer  "giamgia"
    t.integer  "khuyenmaitienmat"
    t.integer  "pttt"
    t.integer  "money_tratruoc"
    t.integer  "tinhtrangdonhang"
    t.integer  "trahang"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_import_receipes", force: true do |t|
    t.integer  "merchant_warehouse_id"
    t.integer  "warehouse_id_xuat"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_kiemton_receipes", force: true do |t|
    t.integer  "merchant_warehouse_id"
    t.string   "decription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_phieugiaohangs", force: true do |t|
    t.integer  "merchant_dondathang_id"
    t.datetime "date_giao"
    t.integer  "nguoigiao_id"
    t.string   "tennguoinhan"
    t.string   "diachi"
    t.integer  "all_money"
    t.integer  "tratruoc"
    t.integer  "phivanchuyen"
    t.string   "ghichu"
    t.integer  "trangthai"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_providers", force: true do |t|
    t.integer  "merchant_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_skulls", force: true do |t|
    t.integer  "merchant_id"
    t.string   "skullcode"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_trahangs", force: true do |t|
    t.integer  "merchant_dondathang_id"
    t.datetime "date_trahang"
    t.string   "lydo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_warehouse_products", force: true do |t|
    t.integer  "merchant_warehouse_id"
    t.string   "name"
    t.integer  "qualtiy_all"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_warehouses", force: true do |t|
    t.integer  "merchant_branche_id"
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_xuat_histories", force: true do |t|
    t.integer  "merchant_xuat_receipe_id"
    t.integer  "merchant_product_chitiet_id"
    t.integer  "qualtity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchant_xuat_receipes", force: true do |t|
    t.integer  "merchant_warehouse_id"
    t.integer  "warehouse_id_nhan"
    t.integer  "create_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.integer  "headquater"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warehouse_product_chitiets", force: true do |t|
    t.string   "product_code"
    t.integer  "merchant_skull_id"
    t.integer  "merchant_provider_id"
    t.integer  "merchant_import_receipe_id"
    t.integer  "merchant_warehouses_id"
    t.string   "name"
    t.integer  "qualtity"
    t.integer  "qualtity_khadi"
    t.integer  "qualtity_ton"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
