class Account < ActiveRecord::Base
  has_secure_password #secret here!
  before_create { generate_token(:auth_token) }
  before_destroy :destroy_account

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Account.exists?(column => self[column])
  end

  after_create :initialize_merchant, :created_role_permission_account


  private

#Khởi tạo merchant
  def initialize_merchant
#Tạo tài khoản gốc Gera
    if self.account_type == 1
      GeraAccount.create({account_id: self.id})

#Tạo tài khoản con Gera
    elsif self.account_type == 2
      GeraAccount.create({account_id: self.id})
#Tạo tài khoản gốc Agency
    elsif self.account_type == 3
#Tạo tài khoản con Agency
    elsif self.account_type == 4

#Tạo tài khoản gốc Merchant
    elsif self.account_type == 5
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
         MerchantAccount.create!({id:self.id, account_id: self.id, merchant_id: current_merchant.id,
                                  branch_id: current_branch.id, current_warehouse_id: current_warehouse.id})
#Tạo tài khoản con Merchant
    elsif self.account_type == 6
        account = MerchantAccount.find_by_account_id(self.parent_id)
        # Tạo mới MerchantAccount
        MerchantAccount.create!({id:self.id, account_id: self.id, merchant_id: account.merchant_id,
                                 branch_id: account.branch_id, current_warehouse_id: account.current_warehouse_id})

    end
  end

  #Khởi tạo phân quyền cho account
  def created_role_permission_account
    #Khởi tạo phân quyền cho Merchant
    if self.account_type == 1 || self.account_type == 3 || self.account_type == 5
    role_admin = Role.create(:headquater_id=> self.id, :role_name =>'Admin')
    role_user = Role.create(:headquater_id => self.id, :role_name =>'User')
    role_member = Role.create(:headquater_id => self.id, :role_name =>'Member')
    per1 = Permission.create(:headquater_id => self.id, :permission_key =>'BanHang' , :permission_name=>'Ban Hang')
    per2 = Permission.create(:headquater_id => self.id, :permission_key =>'XemBaoCao' , :permission_name=>'Xem Bao Cao')
    per3 = Permission.create(:headquater_id => self.id, :permission_key =>'PhanQuyen' , :permission_name=>'Phan Quyen')
    RolePermission.create(:role_id =>role_admin.id, :permission_id=>per1.id)
    RolePermission.create(:role_id =>role_admin.id, :permission_id=>per2.id)
    RolePermission.create(:role_id =>role_admin.id, :permission_id=>per3.id)
    RolePermission.create(:role_id =>role_user.id, :permission_id=>per1.id)
    RolePermission.create(:role_id =>role_user.id, :permission_id=>per2.id)
    RolePermission.create(:role_id =>role_user.id, :permission_id=>per3.id)
    RolePermission.create(:role_id =>role_member.id, :permission_id=>per1.id)
    RolePermission.create(:role_id =>role_member.id, :permission_id=>per2.id)
    RolePermission.create(:role_id =>role_member.id, :permission_id=>per3.id)
    MerchantAccountRole.create(:merchant_account_id =>self.id, :role_id=>role_admin.id,
                              :permission_text=>'BanHang,XemBaoCao,PhanQuyen')
    if self.account_type == 2 || self.account_type == 4 || self.account_type == 6
      MerchantAccountRole.where()
      MerchantAccountRole.create(:merchant_account_id =>self.id, :role_id=>role_admin.id,
                                 :permission_text=>'BanHang,XemBaoCao,PhanQuyen')
    end
    end
  end
  def destroy_account
    #bat loi khi xoa acount co du lieu
    if MerchantAccount.find_by_account_id(self.id) == nil
      #MerchantBranche.create!
    end
  end
end









