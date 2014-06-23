class MerchantAccountPermissionDetailsController < ApplicationController
  before_action :set_merchant_account_permission_detail, only: [:show, :edit, :update, :destroy]

  # GET /merchant_account_permission_details
  # GET /merchant_account_permission_details.json
  def index
    @merchant_account_permission_details = MerchantAccountPermissionDetail.all
  end

  # GET /merchant_account_permission_details/1
  # GET /merchant_account_permission_details/1.json
  def show
  end

  # GET /merchant_account_permission_details/new
  def new
    @merchant_account_permission_detail = MerchantAccountPermissionDetail.new
  end

  # GET /merchant_account_permission_details/1/edit
  def edit
  end

  # POST /merchant_account_permission_details
  # POST /merchant_account_permission_details.json
  def create
    @merchant_account_permission_detail = MerchantAccountPermissionDetail.new(merchant_account_permission_detail_params)

    respond_to do |format|
      if @merchant_account_permission_detail.save
        format.html { redirect_to @merchant_account_permission_detail, notice: 'Merchant account permission detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @merchant_account_permission_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @merchant_account_permission_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchant_account_permission_details/1
  # PATCH/PUT /merchant_account_permission_details/1.json
  def update
    respond_to do |format|
      if @merchant_account_permission_detail.update(merchant_account_permission_detail_params)
        format.html { redirect_to @merchant_account_permission_detail, notice: 'Merchant account permission detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @merchant_account_permission_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchant_account_permission_details/1
  # DELETE /merchant_account_permission_details/1.json
  def destroy
    @merchant_account_permission_detail.destroy
    respond_to do |format|
      format.html { redirect_to merchant_account_permission_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant_account_permission_detail
      @merchant_account_permission_detail = MerchantAccountPermissionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_account_permission_detail_params
      params.require(:merchant_account_permission_detail).permit(:merchant_account_id, :role_id, :permission_text)
    end
end
