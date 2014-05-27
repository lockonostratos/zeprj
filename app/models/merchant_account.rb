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
    #Tìm Các Branch cùng thuộc 1 merchant
    branches = Branch.where(merchant_id:self.merchant_id)
    # a=[]
    # branches.each do |brach|
    #   a+=[branch.id]
    # end

    #Tìm tất cả MerchantAccount thuộc 1 merchant
    merchant_accounts = MerchantAccount.where(branch_id:branches.pluck(:id))
    #Lọc các merchant_account cùng 1 branch
    merchant_account = merchant_accounts.where(branch_id:self.branch_id)

    #Tìm tất cả Warehouse cùng thuộc 1 merchant
    warehouses = Warehouse.where(branch_id:branches.pluck(:id))
    #Tìm tất cả Warehouse cùng 1 branch
    warehouse = warehouses.where(branch_id:self.branch_id)


    staff_count = 0
    staff_count_branch = 0
    #Đếm số lượng nhân viên tổng
    merchant_accounts.each do |ex|
      staff_count += 1
    end
    #Đếm số lượng nhân viên của branch
    merchant_account.each do |ex|
      staff_count_branch += 1
    end

    #lấy thông tin của bản MetroSummary
    metro_summaries = MetroSummary.where(warehouse_id:warehouses.pluck(:id))
    metro_summary = metro_summaries.where(warehouse_id:warehouse.pluck(:id))

    #Save thông tin của bảng Metrosummary
    metro_summaries.each do |metro|
      metro.staff_count = staff_count
      metro.save()
    end
    metro_summary.each do |metro|
      metro.staff_count_branch = staff_count_branch
      metro.save()
    end
  end
end