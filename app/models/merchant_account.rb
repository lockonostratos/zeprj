class MerchantAccount < ActiveRecord::Base



  before_save :add_merchant_account

  private
  def add_merchant_account
    if (Merchant.find(self.merchant_id).id==nil || Account.find(self.account_id).id==nil)
    destroy
    end
  end
end