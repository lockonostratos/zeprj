class Product < ActiveRecord::Base
  #Add quan he
  has_many :export_details
  has_many :inventory_details
  has_many :order_details
  has_many :return_details
  belongs_to :provider
  belongs_to :warehouse
  belongs_to :import
  belongs_to :skull

  #Bat loi View
  validates_presence_of :product_code, :provider, :warehouse, :import, name
  validates_numericality_of :warehouse_id, :merchant_account_id, message: "nhap so"
  validates_length_of :description, minimum:10, maximum: 200




end