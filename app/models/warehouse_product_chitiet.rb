class WarehouseProductChitiet< ActiveRecord::Base
  skip_before_filter :check_user_permission, :only => [:new, :create]
  before_action :set_gera_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index

  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @warehouse_procuct=WarehouseProductChitiet.new()
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @warehouse_procuct=WarehouseProductChitiet.new

    respond_to do |format|
      if @warehouse_procuct.save
        format.html { redirect_to @warehouse_procuct, notice: 'Gera Warehouse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @warehouse_procuct }
      else
        format.html { render action: 'new' }
        format.json { render json: @warehouse_procuct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @warehouse_procuct.update()
        format.html { redirect_to @warehouse_procuct, notice: 'Gera account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @warehouse_procuct.errors, status: :unprocessable_entity }
      end

     end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json

  def set_gera_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:display_name, :login_name, :email, :phone, :status, :password)
  end

end