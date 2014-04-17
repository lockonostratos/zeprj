class MerchantWarehousController < ApplicationController
  def index
    @accounts = Account.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @user = current_user
    unless @user.nil?
      respond_to do |format|
        format.html
        format.json { render json: { user: @user.as_json(only: :email) } }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: { }, status: :accepted }
      end
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
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

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Gera account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  \



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_gera_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def account_params
    params.require(:account).permit(:display_name, :login_name, :email, :phone, :status, :password)
  end
end