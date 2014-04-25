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

  belongs_to :module_role
  belongs_to :account
  belongs_to :merchant
  belongs_to :branch


  before_save :add_merchant_account

  private
  def add_merchant_account
    if (Merchant.find(self.merchant_id).id==nil || Account.find(self.account_id).id==nil)
    destroy
    end
  end
end