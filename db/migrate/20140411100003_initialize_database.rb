class InitializeDatabase < ActiveRecord::Migration
  def change
    #Tai khoan Gera
    create_table :gera_accounts do |t|
      t.belongs_to :account
      t.integer :role_id

      t.timestamps
    end

    #Nha cung cap
    create_table :agencies do |t|
      t.string :name
      t.integer :headquater_id

      t.timestamps
    end

    create_table :agency_accounts do |t|
      t.belongs_to :account
      t.belongs_to :agency
      t.integer :role_id

      t.timestamps
    end
    #MERCHANTS SECTION------------------------------------------------------------------------------------------->

    #Dai ly ban le------------------------------------------->
    create_table :merchants do |t|
      t.integer :headquater_id, :null => false, :default => 0
      t.integer :owner_id, :null => false
      t.string :name, :null => false
      t.timestamps
    end

    #Tai khoan cua dai ly------------------------------------>
    create_table :merchant_accounts do |t|
      t.belongs_to :account, :null => false #xem lai phan ke thua
      t.belongs_to :merchant, :null => false
      t.belongs_to :branch, :null => false , :default => 0

      t.integer :role_id, :null => false , :default => 0 #bang role o dau?

      t.timestamps
    end

    #Khach hang---------------------------------------------->
    create_table :customers do |t|
      t.belongs_to :merchant
      t.belongs_to :merchant_account

      t.string :account_name
      t.string :password
      t.string :email

      t.timestamps
    end

    #Ho so mackay
    create_table :mackay_profiles do |t|
      t.belongs_to :merchant_customer
      t.string :m1_1
      t.string :m1_2
      t.string :m1_3
      t.string :m2_1

      t.timestamps
    end

    #Nha cung cap-------------------------------------------->
    create_table :providers do |t|
      t.belongs_to :merchant, :null => false
      t.string :name, :null => false

      t.timestamps
    end

    #Skull--------------------------------------------------->
    create_table :skulls do |t|
      t.belongs_to :merchant, :null => false
      t.belongs_to :merchant_account, :null => false

      t.string :skull_code, :null => false
      t.string :description

      t.timestamps
    end

    #Chi nhanh----------------------------------------------->
    create_table :branches do |t|
      t.belongs_to :merchant, :null => false
      t.string :name, :null => false

      t.timestamps
    end

    #Kho----------------------------------------------------->
    create_table :warehouses do |t|
      t.belongs_to :branch, :null => false
      t.string :name, :null => false
      t.string :location

      t.timestamps
    end

    #Phieu nhap kho------------------------------------------>
    create_table :imports do |t|
      t.belongs_to :warehouse, :null => false
      t.text :description, :null => false
      t.integer :create_id, :null => false

      t.timestamps
    end

    #San pham------------------------------------------------>
    create_table :product_summaries do |t|
      t.string :product_code, :null => false
      t.string :skull_code, :null => false
      t.integer :warehouse, :null => false
      t.string :name, :null => false
      t.integer :qualtiy, :null => false
      t.decimal :price, :presence => 15

      t.timestamps
    end

    #Bang CHI TIET san pham!--------------------------------->
    create_table :products do |t|
      t.string :product_code, :null => false
      t.belongs_to :skull, :null => false
      t.belongs_to :provider, :null => false
      t.belongs_to :warehouse, :null => false
      t.belongs_to :import, :null => false

      t.string :name, :null => false
      t.integer :import_quality, :null => false #so luong nhap
      t.integer :available_quality, :null => false #so luong kha di~
      t.integer :instock_quality, :null => false #so luong thuc te con trong kho
      t.decimal :import_price, :presence => 15
      t.datetime :expire

      t.timestamps
    end

    #Phieu xuat kho------------------------------------------>
    create_table :exports do |t|
      t.belongs_to :merchant_account, :null => false
      t.belongs_to :warehouse, :null => false
      t.integer :target_warehouse_id

      t.text :description, :null => false

      t.timestamps
    end

    #Chi tiet xuat kho--------------------------------------->
    create_table :export_details do |t|
      t.belongs_to :export, :null => false
      t.belongs_to :product, :null => false

      t.integer :quality, :null => false

      t.timestamps
    end

    #Phieu kiem ton------------------------------------------>
    create_table :inventories do |t|
      t.belongs_to :warehouse, :null => false
      t.belongs_to :merchant_account, :null => false

      t.text :decription, :null => false
      t.boolean :success, :null => false

      t.timestamps
    end

    #Chi tiet kiem ton--------------------------------------->
    create_table :inventory_details do |t|
      t.belongs_to :product, :null => false
      t.belongs_to :inventory, :null => false
      t.integer :original_quality, :null => false
      t.integer :real_quality, :null => false

      t.timestamps
    end

    #Don dat hang-------------------------------------------->
    create_table :orders do |t|
      t.belongs_to :branch, :null => false
      t.belongs_to :warehouse, :null => false
      t.belongs_to :merchant_account, :null => false
      t.belongs_to :customer, :null => false
      t.integer :return_id, :null => false, :default => 0 #Id don tra hang (neu co)

      t.datetime :creation_date, :null => false
      t.datetime :delivery_date, :null => false
      t.string :delivery_address, :null => false
      t.string :contact_name, :null => false
      t.string :contact_phone, :null => false

      t.decimal :total_price, :null => false #tong gia tri hoa don
      t.decimal :deposit, :null => false #tra truoc
      t.decimal :discount_cash, :null => false, :default => 0 #giam gia tinh bang tien mat
      t.decimal :final_price, :null => false #so tien phai thu

      t.integer :payment_method, :null => false #chuyen thanh kieu Enumerable
      t.integer :status, :null => false, :default => 0 #tinh trang don hang

      t.timestamps
    end

    #Chi tiet don hang---------------------------------------->
    create_table :order_details do |t|
      t.belongs_to :order, :null => false
      t.belongs_to :product, :null => false

      t.integer :quality, :null => false
      t.integer :return_quality, :null => false, :default => 0
      t.decimal :price, :null => false
      t.decimal :discount_cash, :null => false

      t.timestamps
    end

    #Phieu giao hang------------------------------------------>
    create_table :deliveries do |t|
      t.belongs_to :order, :null => false
      t.belongs_to :merchant_account, :null => false

      t.datetime :delivery_date, :null => false
      t.decimal :transportation_fee, :null => false
      t.string :comment, :null => false
      t.integer :status, :null => false

      t.timestamps
    end

    #???????????????????????????????????????????? XOA!
    #create_table :merchant_chitiet_dondathangs do |t|
    #  t.belongs_to :warehouse_product_chitiets, :null => false
    #  t.belongs_to :merchant_dondathang, :null => false
    #  t.integer :quality, :null => false
    #  t.decimal :price, :null => false
    #  t.decimal :giamgia, :null => false
    #  t.string :tinhtrang, :null => false
    #
    #  t.timestamps
    #end

    #Phieu tra hang------------------------------------------->
    create_table :returns do |t|
      t.belongs_to :order, :null => false
      t.belongs_to :merchant_account, :null => false

      t.datetime :creation_date, :null => false
      t.string :comment, :null => false

      t.timestamps
    end

    #Chi tiet tra hang---------------------------------------->
    create_table :return_details do |t|
      t.belongs_to :return, :null => false
      t.belongs_to :product, :null => false

      t.integer :current_quality, :null => false
      t.integer :return_quality, :null => false

      t.timestamps
    end

  end
end
