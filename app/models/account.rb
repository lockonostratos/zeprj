class Account < ActiveRecord::Base
  has_secure_password #secret here!
  before_create { generate_token(:auth_token) }
  before_destroy :destroy_account

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Account.exists?(column => self[column])
  end

  after_create :add_to_merchant


  private

  def add_to_merchant
   mer= Merchant.create! ({name:"abcd", headquater:12})
   bran= MerchantBranche.create! ({merchant_id:mer.id, name:"asdadas"})
   MerchantAccount.create!({account_id:self.id,merchant_id:mer.id,name:"aaaaaaaa"})
   MerchantWarehouse.create! ({merchant_branche_id:bran.id, name:"asdasdas"})
  end

  def destroy_account
    if(MerchantAccount.find_by_account_id(self.id)!=nil)
      MerchantBranche.create!
    end
  end

end








