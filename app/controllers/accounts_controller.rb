class AccountsController < ApplicationController
  before_action :set_gera_account, only: [:show, :edit, :update, :destroy]

  # GET /Accounts
  # GET /Accounts.json
  def index
    @accounts = Account.all
  end

  # GET /Accounts/1
  # GET /Accounts/1.json
  def show
  end

  # GET /Accounts/new
  def new
    @account = Account.new
  end

  # GET /Accounts/1/edit
  def edit
  end

  # POST /Accounts
  # POST /Accounts.json
  def create
    @account = Account.new(gera_account_params)

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

  # PATCH/PUT /Accounts/1
  # PATCH/PUT /Accounts/1.json
  def update
    respond_to do |format|
      if @account.update(gera_account_params)
        format.html { redirect_to @account, notice: 'Gera account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Accounts/1
  # DELETE /Accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to gera_accounts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gera_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gera_account_params
      params.require(:account).permit(:display_name, :login_name, :email, :phone, :status, :password)
    end
end
