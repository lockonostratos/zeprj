class Account < ActiveRecord::Base
  has_secure_password #secret here!
  before_create { generate_token(:auth_token) }
  before_destroy :destroy_account

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Account.exists?(column => self[column])
  end

  after_create :initialize_merchant


  private

  #Khởi tạo merchant
  def initialize_merchant
    if self.parent_id == 0
      #1. Tạo mới Merchant
      current_merchant= Merchant.create! ({name: self.email + '\'s merchant', owner_id: self.id})
      current_merchant.save()


      #2. Tạo mới Branch *chi nhánh*, gán headquater_id của merchant thành id chi nhánh mới (mặc định)
      current_branch= Branch.create! ({merchant_id: current_merchant.id, name: self.email + '\'s headquater'})
      current_merchant.save()
      current_merchant.headquater_id = current_branch.id

      #3. Tạo mới Warehouse (kho),
      current_warehouse=Warehouse.find_by_branch_id(current_branch.id)

      #4. Tạo mới MerchantAccount, ..............................................................................................................................................................................................................................cv
       MerchantAccount.create!({account_id: self.id, merchant_id: current_merchant.id,
                                branch_id: current_branch.id, current_warehouse_id: current_warehouse.id})

      #5. Tạo mới Skull
      current_skull=Skull.create!({merchant_id:current_merchant.id, merchant_account_id:self.id,
                                   skull_code:"aasdas", description: 'one default skull'})

      #6. Tao mới Provider
      current_provider=Provider.create!({merchant_id:current_merchant.id, name:'one default provider'})
    else
      account = MerchantAccount.find_by_account_id(self.parent_id)
      # Tạo mới MerchantAccount
      MerchantAccount.create!({account_id: self.id, merchant_id: account.merchant_id,
                               branch_id: account.branch_id, current_warehouse_id: account.current_warehouse_id})
    end
  end

  def destroy_account
    #bat loi khi xoa acount co du lieu
    if MerchantAccount.find_by_account_id(self.id) == nil
      #MerchantBranche.create!
    end
  end
end














