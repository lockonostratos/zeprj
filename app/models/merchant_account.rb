class MerchantAccount < ActiveRecord::Base
  has_many :customers
  has_many :skulls
  has_many :exports
  has_many :inventories
  has_many :orders
  has_many :deliveries
  has_many :returns
  has_many :imports
  has_many :areas
  has_many :product_summaries
  has_many :merchant_account_roles
  has_many :merchant_account_permissions
  has_many :merchant_account_permission_details

  belongs_to :module_role
  belongs_to :account
  belongs_to :merchant
  belongs_to :branch


  before_save :add_merchant_account
  after_create :add_staff_count_metro_summary

  private
  def add_merchant_account
    if (Merchant.find(self.merchant_id).id==nil || Account.find(self.account_id).id==nil)
    destroy
    end
  end

  def add_staff_count_metro_summary
    branches = Branch.where(merchant_id:self.merchant_id)
    warehouses = Warehouse.where(branch_id:branches.pluck(id))
    warehouse = warehouses.where(branch_id:self.branch_id)
    metro_summaries = MetroSummary.where(warehouse_id:warehouses.pluck(:id))
    metro_summary = metro_summaries.where(warehouse_id:warehouse.pluck(:id))
    metro_summaries.each do |metro|
      metro.staff_count += 1
      metro.save()
    end
    metro_summary.each do |metro|
      metro.staff_count_branch += 1
      metro.save()
    end
  end
end