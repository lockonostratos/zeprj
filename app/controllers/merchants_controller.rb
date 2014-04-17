class MerchantsController < ApplicationController
  def index

  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.new()
    @account.password_confirmation = @account.password;

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Gera account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @account }
      else
        format.html { render action: 'new' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
end
