class MerchantAccountRolesController < ApplicationController
  before_action :set_merchant_account_role, only: [:show, :edit, :update, :destroy]

  # GET /merchant_account_roles
  # GET /merchant_account_roles.json
  def index
    @merchant_account_roles = MerchantAccountRole.all
  end

  # GET /merchant_account_roles/1
  # GET /merchant_account_roles/1.json
  def show
  end

  # GET /merchant_account_roles/new
  def new
    @merchant_account_role = MerchantAccountRole.new
  end

  # GET /merchant_account_roles/1/edit
  def edit
  end

  # POST /merchant_account_roles
  # POST /merchant_account_roles.json
  def create
    @merchant_account_role = MerchantAccountRole.new(merchant_account_role_params)
    update_merchant_account_permission_detail_by_merchant_account_role

    respond_to do |format|
      if @merchant_account_role.save
        format.html { redirect_to @merchant_account_role, notice: 'Merchant account role was successfully created.' }
        format.json { render action: 'show', status: :created, location: @merchant_account_role }
      else
        format.html { render action: 'new' }
        format.json { render json: @merchant_account_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchant_account_roles/1
  # PATCH/PUT /merchant_account_roles/1.json
  def update
    #cập nhật phân quầy
    @merchant_account_role.attributes =(merchant_account_role_params)
    update_merchant_account_permission_detail_by_merchant_account_role
    respond_to do |format|
      if @merchant_account_role.save()
        format.html { redirect_to @merchant_account_role, notice: 'Merchant account role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @merchant_account_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchant_account_roles/1
  # DELETE /merchant_account_roles/1.json
  def destroy
    @merchant_account_role.destroy
    respond_to do |format|
      format.html { redirect_to merchant_account_roles_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_merchant_account_role
    @merchant_account_role = MerchantAccountRole.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def merchant_account_role_params
    params.require(:merchant_account_role).permit(:merchant_account_id, :role_id, :permission_text)
  end

  def update_merchant_account_permission_detail_by_merchant_account_role
    current_permission = Permission.all
    a=[]
    RolePermission.where(role_id:@merchant_account_role.role_id).each do |role_permission|
      a= a + [current_permission.find(role_permission.permission_id).permission_key]
    end
    @merchant_account_role.permission_text = a.join(',')
  end

end
