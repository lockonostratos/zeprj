class InitializeDatabase < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.integer :headquater, :null => false
      t.string :name, :null => false
      t.timestamps
    end

    create_table :merchant_accounts do |t|
      t.belongs_to :account, :null => false
      t.belongs_to :merchants, :null => false
      t.belongs_to :merchant_branche, :null => false , :default => 0
      t.string :name, :null => false
      t.integer :role_id, :null => false , :default => 0

      t.timestamps
    end

    create_table :merchant_providers do |t|
      t.belongs_to :merchants, :null => false
      t.string :name, :null => false

      t.timestamps
    end

    create_table :merchant_skulls do |t|
      t.belongs_to :merchants, :null => false
      t.string :skull_code, :null => false
      t.string :description
      t.integer :create_id, :null => false

      t.timestamps
    end

    create_table :merchant_branches do |t|
      t.belongs_to :merchants, :null => false
      t.string :name, :null => false

      t.timestamps
    end

    create_table :merchant_warehouses do |t|
      t.belongs_to :merchant_branche, :null => false
      t.string :name, :null => false
      t.string :location

      t.timestamps
    end

    create_table :merchant_import_receipes do |t|
      t.belongs_to :merchant_warehouse, :null => false
      t.integer :warehouse_id_xuat, :null => false
      t.text :description, :null => false
      t.integer :create_id, :null => false

      t.timestamps
    end

    create_table :merchant_warehouse_products do |t|
      t.string :product_code, :null => false
      t.string :skull_code, :null => false
      t.integer :merchant_warehouse, :null => false
      t.string :name, :null => false
      t.integer :qualtiy_all, :null => false
      t.decimal :price, :presence => 15

      t.timestamps
    end

    create_table :warehouse_product_chitiets do |t|
      t.string :product_code, :null => false
      t.belongs_to :merchant_skull, :null => false
      t.belongs_to :merchant_provider, :null => false
      t.belongs_to :merchant_import_receipe, :null => false
      t.belongs_to :merchant_warehouses, :null => false
      t.string :name, :null => false
      t.integer :qualtity, :null => false
      t.integer :qualtity_khadi, :null => false
      t.integer :qualtity_ton, :null => false
      t.decimal :price, :presence => 15
      t.datetime :hansudung

      t.timestamps
    end

    create_table :merchant_xuat_receipes do |t|
      t.belongs_to :merchant_warehouse, :null => false
      t.integer :warehouse_id_nhan, :null => false
      t.integer :create_id, :null => false
      t.text :description, :null => false

      t.timestamps
    end

    create_table :merchant_xuat_histories do |t|
      t.belongs_to :merchant_xuat_receipe, :null => false
      t.belongs_to :warehouse_product_chitiets, :null => false
      t.integer :qualtity, :null => false

      t.timestamps
    end

    create_table :merchant_dondathangs do |t|
      t.belongs_to :merchant_warehouse, :null => false
      t.datetime :date_dat, :null => false
      t.datetime :date_giao, :null => false
      t.integer :create_id, :null => false
      t.integer :nguoimua_id, :null => false
      t.string :diachigiao, :null => false
      t.string :tennguoinhan, :null => false
      t.string :sdt, :null => false
      t.decimal :all_money, :null => false
      t.decimal :giamgia, :null => false, :default => 0
      t.decimal :khuyenmaitienmat, :null => false, :default => 0
      t.integer :pttt, :null => false
      t.decimal :money_tratruoc, :null => false, :default => 0
      t.integer :tinhtrangdonhang, :null => false, :default => 0
      t.integer :trahang, :null => false, :default => 0

      t.timestamps
    end

    create_table :merchant_phieugiaohangs do |t|
      t.belongs_to :merchant_dondathang, :null => false
      t.datetime :date_giao, :null => false
      t.integer :nguoigiao_id, :null => false
      t.string :tennguoinhan, :null => false
      t.text :diachi, :null => false
      t.decimal :all_money, :null => false
      t.decimal :tratruoc, :null => false
      t.decimal :phivanchuyen, :null => false
      t.text :ghichu, :null => false
      t.integer :trangthai, :null => false

      t.timestamps
    end

    create_table :merchant_chitiet_donhangs do |t|
      t.belongs_to :merchant_dondathang, :null => false
      t.integer :product_code, :null => false
      t.integer :skull_code, :null => false
      t.integer :qualtity, :null => false
      t.integer :qualtity_soluongtra, :null => false, :default => 0
      t.decimal :price, :null => false
      t.decimal :giamgia, :null => false

      t.timestamps
    end

    create_table :merchant_trahangs do |t|
      t.belongs_to :merchant_dondathang, :null => false
      t.datetime :date_trahang, :null => false
      t.text :lydo

      t.timestamps
    end

    create_table :merchant_chitiet_trahangs do |t|
      t.belongs_to :merchant_chitiet_trahang, :null => false
      t.belongs_to :warehouse_product_chitiets, :null => false
      t.integer :qualtity, :null => false

      t.timestamps
    end

    create_table :merchant_kiemton_receipes do |t|
      t.belongs_to :merchant_warehouse, :null => false
      t.text :decription, :null => false
      t.integer :create_id, :null => false

      t.timestamps
    end

    create_table :merchant_chitiet_kiemtons do |t|
      t.belongs_to :warehouse_product_chitiets, :null => false
      t.belongs_to :merchant_kiemton_receipe, :null => false
      t.integer :qualtity, :null => false
      t.integer :qualtity_thucte, :null => false

      t.timestamps
    end

    create_table :merchant_chitiet_dondathangs do |t|
      t.belongs_to :warehouse_product_chitiets, :null => false
      t.belongs_to :merchant_dondathang, :null => false
      t.integer :qualtity, :null => false
      t.decimal :price, :null => false
      t.decimal :giamgia, :null => false
      t.string :tinhtrang, :null => false

      t.timestamps
    end

    create_table :merchant_customers do |t|
      t.belongs_to :merchants
      t.string :account_name
      t.string :password
      t.string :email

      t.timestamps
    end

    create_table :merchant_customer_mackay_profiles do |t|
      t.belongs_to :merchant_customer
      t.string :m1_1
      t.string :m1_2
      t.string :m1_3
      t.string :m2_1

      t.timestamps
    end

    create_table :gera_accounts do |t|
      t.belongs_to :accounts
      t.integer :role_id

      t.timestamps
    end

    create_table :agencies do |t|
      t.string :name
      t.integer :headquater_id

      t.timestamps
    end

    create_table :agency_accounts do |t|
      t.belongs_to :accounts
      t.belongs_to :agencies
      t.integer :role_id
      t.timestamps
    end



  end
end
