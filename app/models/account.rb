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
   #
   mer= Merchant.create! ({name:"abcd", headquater:12})

   #bat loi khi merchant_id ko ton tai
   bran= MerchantBranche.create! ({merchant_id:mer.id, name:"asdadas"})

   #bat loi khi account_id ko ton tai, merchant_id ko ton tai
   meracc=MerchantAccount.create!({account_id:self.id,merchant_id:mer.id,name:"aaaaaaaa"})

   #bat loi khi merchant_branche_id ko ton tai
   ware=MerchantWarehouse.create! ({merchant_branche_id:bran.id, name:"asdasdas"})

   #bat loi khi merchant_id ko ton tai, create_id ko ton tai
   skull=MerchantSkull.create!({merchant_id:mer.id, skull_code:"abcdefg", create_id:self.id})

   #bat loi khi merchant_id ko ton tai
   pro=MerchantProvider.create!({merchant_id:mer.id, name:"SamSung"})

   #bat loi khi cac ID ko ton tai
   merimport=MerchantImportReceipe.create!({create_id: meracc.id,merchant_warehouse_id: ware.id, warehouse_id_xuat:ware.id, description:"123456789"})


   wareproduct=WarehouseProductChitiet.create!({product_code:"abcd111111", merchant_skull_id:skull.id, merchant_provider_id:pro.id, merchant_import_receipe_id:merimport.id,
                                                 merchant_warehouses_id:ware.id,name:"sang kung", qualtity:200, qualtity_khadi:100, qualtity_ton:50, price:500})

  end

  def destroy_account
    #bat loi khi xoa acount co du lieu
    if(MerchantAccount.find_by_account_id(self.id)!=nil)
      MerchantBranche.create!
    end
  end

end














