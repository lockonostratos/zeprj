class MerchantAccountsController < ApplicationController
  # GET /accounts/1
  # GET /accounts/1.json
  def show
    if params[:id] == '0'
      @merchant_account = MerchantAccount.find(@current_account.id)
    else
      @merchant_account = MerchantAccount.find(params[:id])
    end

    if @merchant_account.nil?
      respond_to do |format|
        format.html
        format.json { render json: {}, status: :accepted }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: @merchant_account }
      end
    end
  end
end