class Warehouse < ActiveRecord::Base
  has_many :imports
  has_many :exports
  has_many :inventories
  has_many :orders
  has_many :products
  has_many :product_summaries
  has_many :role_warehouses

  belongs_to :branch


  before_create :create_warehouse
  before_destroy :destroy_warehouse

  private
  def create_warehouse
  #  Bat loi khi Brach ko co
    if (Branch.find(self.branch_id)==nil)
    end

  end

  def destroy_warehouse
    #Bat loi co skull Product va ProductSummary
    if(Import.find_by_warehouse_id(self.id)!=nil || Export.find_by_warehouse_id(self.id)!=nil || Inventory.find_by_warehouse_id(self.id)!=nil || Order.find_by_warehouse_id(self.id)!=nil || Product.find_by_warehouse_id(self.id)!=nil || ProductSummary.find_by_warehouse_id(self.id)!=nil)
      MerchantBranche.create!
    end

  end
end