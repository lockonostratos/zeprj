class GeraAccountsController < ApplicationController
  before_action :set_gera_account, only: [:show, :edit, :update, :destroy]

  # GET /gera_accounts
  # GET /gera_accounts.json
  def index
    @gera_accounts = GeraAccount.all
  end

  # GET /gera_accounts/1
  # GET /gera_accounts/1.json
  def show
  end

  # GET /gera_accounts/new
  def new
    @gera_account = GeraAccount.new
  end

  # GET /gera_accounts/1/edit
  def edit
  end

  # POST /gera_accounts
  # POST /gera_accounts.json
  def create
    @gera_account = GeraAccount.new(gera_account_params)

    respond_to do |format|
      if @gera_account.save
        format.html { redirect_to @gera_account, notice: 'Gera account was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gera_account }
      else
        format.html { render action: 'new' }
        format.json { render json: @gera_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gera_accounts/1
  # PATCH/PUT /gera_accounts/1.json
  def update
    respond_to do |format|
      if @gera_account.update(gera_account_params)
        format.html { redirect_to @gera_account, notice: 'Gera account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gera_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gera_accounts/1
  # DELETE /gera_accounts/1.json
  def destroy
    @gera_account.destroy
    respond_to do |format|
      format.html { redirect_to gera_accounts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gera_account
      @gera_account = GeraAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gera_account_params
      params.require(:gera_account).permit(:display_name, :login_name, :email, :password)
    end
end
