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
end
