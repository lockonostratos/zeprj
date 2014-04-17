class Account < ActiveRecord::Base
  has_secure_password #secret here!
  before_create { [generate_token(:auth_token), ] }
  after_create { add_to_merchant }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Account.exists?(column => self[column])
  end

  private
  def add_to_merchant
   mer= Merchant.create! ({name:"abcd", headquater:self.id})
   bran= MerchantBranche.create! ({merchant_id:mer.id, name:"asdadas"})
   MerchantWarehouse.create! ({merchant_branche_id:bran.id, name:"asdasdas"})
  end
end