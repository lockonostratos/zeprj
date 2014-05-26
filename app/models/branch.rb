class Branch < ActiveRecord::Base
  has_many :warehouses
  has_many :orders
  has_many :merchant_accounts

  belongs_to :merchant

  after_create :create_warehouse
  before_destroy :destroy_branch

  private
  def create_warehouse
    if(Merchant.find(self.merchant_id))
    end
    #Tao Warehouse sau khi tao Branch
    Warehouse.create!({branch_id:self.id, name:self.name})
  end

  def destroy_branch
    #Bat loi co skull Product va ProductSummary
    if(Warehouse.find_by_branch_id(self.id)!=nil)
     MerchantBranche.create!
    end

  end
end