class MerchantApplicationController < ApplicationController
  def current_merchant_account
    @current_merchant_account ||= MerchantAccount.find(@current_account.id) if @current_account
  end

  helper_method :current_merchant_account

  def permission_merchant_account
    permission = Permission.all
    current_permission=[]
    perm_role = MerchantAccountRole.where(merchant_account_id:current_merchant_account.id)
    perm_role.each do |permission|
      current_permission=current_permission + permission.permission_text.split(',')
    end
    current_permission = current_permission.uniq()
    merchant_perm = MerchantAccountPermission.where(merchant_account_id: current_merchant_account.id)
    merchant_perm.each do |mer_perm|
      if mer_perm.active == true
        current_permission = current_permission + [permission.find(mer_perm.permission_id).permission_key]
      else
        current_permission = current_permission - [permission.find(mer_perm.permission_id).permission_key]
      end
    end
    return current_permission
  end

  #Kiểm tra warehouse_id có cùng merchant với account hay ko , có thì return true
  def check_warehouse_permission(warehouse_id)
    #@warehouses.where(branch_id:2)
    #Lọc Warehouse theo permission
    #@warehouses = @warehouses.where.not(id:1)
    #params =  {id:3, branch_id:2, name:'1'}
    #@warehouses = @warehouses - params.to_a

    branch = Branch.where(merchant_id:current_merchant_account.merchant_id)
    @warehouses = Warehouse.where(branch_id:(branch.pluck(:id)))
    warehoues=(@warehouses.pluck(:id))
    warehoues.each do |ex|
      return true if (ex.to_param == warehouse_id )
    end
  end
end
