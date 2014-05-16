class MerchantAccountPermissionsController < ApplicationController
  before_action :set_merchant_account_permission, only: [:show, :edit, :update, :destroy]

  # GET /merchant_account_permissions
  # GET /merchant_account_permissions.json
  def index
    @merchant_account_permissions = MerchantAccountPermission.all
  end

  # GET /merchant_account_permissions/1
  # GET /merchant_account_permissions/1.json
  def show
  end

  # GET /merchant_account_permissions/new
  def new
    @merchant_account_permission = MerchantAccountPermission.new
  end

  # GET /merchant_account_permissions/1/edit
  def edit
  end

  # POST /merchant_account_permissions
  # POST /merchant_account_permissions.json
  def create
    @merchant_account_permission = MerchantAccountPermission.new(merchant_account_permission_params)

    respond_to do |format|
      if @merchant_account_permission.save
        format.html { redirect_to @merchant_account_permission, notice: 'Merchant account permission was successfully created.' }
        format.json { render action: 'show', status: :created, location: @merchant_account_permission }
      else
        format.html { render action: 'new' }
        format.json { render json: @merchant_account_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchant_account_permissions/1
  # PATCH/PUT /merchant_account_permissions/1.json
  def update
    respond_to do |format|
      if @merchant_account_permission.update(merchant_account_permission_params)
        format.html { redirect_to @merchant_account_permission, notice: 'Merchant account permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @merchant_account_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchant_account_permissions/1
  # DELETE /merchant_account_permissions/1.json
  def destroy
    @merchant_account_permission.destroy
    respond_to do |format|
      format.html { redirect_to merchant_account_permissions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant_account_permission
      @merchant_account_permission = MerchantAccountPermission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_account_permission_params
      params.require(:merchant_account_permission).permit(:merchant_account_id, :permission_id, :active)
    end
end
