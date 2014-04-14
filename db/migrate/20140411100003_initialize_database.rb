class InitializeDatabase < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.integer :headquater
      t.string :name ,:null => false

      t.timestamps
    end

    create_table :merchant_acounts do |t|
      t.belongs_to :merchant
      t.boolean :name3 , :null => true

      t.timestamps
    end

    create_table :merchant_providers do |t|
      t.belongs_to :merchant
      t.string :name

      t.timestamps
    end

    create_table :merchant_skulls do |t|
      t.belongs_to :merchant
      t.string :skullcode
      t.string :description

      t.timestamps
    end

    create_table :merchant_branches do |t|
      t.belongs_to :merchant
      t.string :name

      t.timestamps
    end

    create_table :merchant_warehouses do |t|
      t.belongs_to :merchant_branche
      t.string :name
      t.string :location

      t.timestamps
    end

    create_table :merchant_import_receipes do |t|
      t.belongs_to :merchant_warehouse
      t.integer :warehouse_id_xuat
      t.string :description

      t.timestamps
    end

    create_table :merchant_warehouse_products do |t|
      t.belongs_to :merchant_warehouse
      t.string :name
      t.integer :qualtiy_all
      t.integer :price

      t.timestamps
    end

    create_table :warehouse_product_chitiets do |t|
      t.string :product_code
      t.belongs_to :merchant_skull
      t.belongs_to :merchant_provider
      t.belongs_to :merchant_import_receipe
      t.belongs_to :merchant_warehouses
      t.string :name
      t.integer :qualtity
      t.integer :qualtity_khadi
      t.integer :qualtity_ton
      t.integer :price

      t.timestamps
    end

    create_table :merchant_xuat_receipes do |t|
      t.belongs_to :merchant_warehouse
      t.integer :warehouse_id_nhan
      t.integer :create_id
      t.string :description

      t.timestamps
    end

    create_table :merchant_xuat_histories do |t|
      t.belongs_to :merchant_xuat_receipe
      t.belongs_to :merchant_product_chitiet
      t.integer :qualtity

      t.timestamps
    end

    create_table :merchant_dondathangs do |t|
      t.belongs_to :merchant_warehouse
      t.datetime :date_dat
      t.datetime :date_giao
      t.integer :create_id
      t.integer :nguoimua_id
      t.string :diachigiao
      t.string :tennguoinhan
      t.string :sdt
      t.integer :all_money
      t.integer :giamgia
      t.integer :khuyenmaitienmat
      t.integer :pttt
      t.integer :money_tratruoc
      t.integer :tinhtrangdonhang
      t.integer :trahang

      t.timestamps
    end

    create_table :merchant_phieugiaohangs do |t|
      t.belongs_to :merchant_dondathang
      t.datetime :date_giao
      t.integer :nguoigiao_id
      t.string :tennguoinhan
      t.string :diachi
      t.integer :all_money
      t.integer :tratruoc
      t.integer :phivanchuyen
      t.string :ghichu
      t.integer :trangthai

      t.timestamps
    end

    create_table :merchant_chitiet_donhangs do |t|
      t.belongs_to :merchant_dondathang
      t.integer :product_code
      t.integer :skull_code
      t.integer :qualtity
      t.integer :qualtity_soluongtra
      t.integer :price
      t.integer :giamgia

      t.timestamps
    end

    create_table :merchant_trahangs do |t|
      t.belongs_to :merchant_dondathang
      t.datetime :date_trahang
      t.string :lydo

      t.timestamps
    end

    create_table :merchant_chitiet_trahangs do |t|
      t.belongs_to :merchant_chitiet_trahang
      t.belongs_to :merchant_product_chitiet
      t.integer :qualtity

      t.timestamps
    end

    create_table :merchant_kiemton_receipes do |t|
      t.belongs_to :merchant_warehouse
      t.string :decription

      t.timestamps
    end

    create_table :merchant_chitiet_kiemtons do |t|
      t.belongs_to :merchant_product_chitiet
      t.belongs_to :merchant_kiemton_receipe
      t.integer :qualtity
      t.integer :qualtity_thucte

      t.timestamps
    end

    create_table :merchant_chitiet_dondathangs do |t|
      t.belongs_to :merchant_product_chitiet
      t.belongs_to :merchant_dondathang
      t.integer :qualtity
      t.integer :price
      t.integer :giamgia
      t.string :tinhtrang

      t.timestamps
    end

    create_table :merchant_customers do |t|
      t.belongs_to :merchant
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

  end
end
