class MerchantApplicationController < ApplicationController
  def current_merchant_account
    @current_merchant_account ||= MerchantAccount.find(@current_account.id) if @current_account
  end

  helper_method :current_merchant_account
end
