class MerchantsController < ApplicationController
  skip_before_filter :check_user_permission, :only => [:new, :create]
  before_action :set_gera_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @merchants = Merchant.all

    respond_to do |format|
      format.html
      format.json {render json: @merchants}
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show  
  end

  # GET /accounts/new
  def new
    @merchant = Merchant.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @merchant = Merchant.new(account_params)
    @merchant.password_confirmation = @merchant.password

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Gera account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @merchant }
      else
        format.html { render action: 'new' }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @merchant, notice: 'Gera account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gera_account
   # @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:display_name, :login_name, :email, :phone, :status, :password)
  end
end
