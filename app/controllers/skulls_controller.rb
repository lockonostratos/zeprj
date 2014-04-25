class SkullsController < ApplicationController
  before_action :set_skull, only: [:show, :edit, :update, :destroy]

  # GET /skulls
  # GET /skulls.json
  def index
    @skulls = Skull.all
  end

  # GET /skulls/1
  # GET /skulls/1.json
  def show
  end

  # GET /skulls/new
  def new
    @skull = Skull.new
  end

  # GET /skulls/1/edit
  def edit
  end

  # POST /skulls
  # POST /skulls.json
  def create
    @skull = Skull.new(skull_params)
    respond_to do |format|
      if @skull.save
        format.html { redirect_to @skull, notice: 'Skull was successfully created.' }
        format.json { render action: 'show', status: :created, location: @skull }
      else
        format.html { render action: 'new' }
        format.json { render json: @skull.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skulls/1
  # PATCH/PUT /skulls/1.json
  def update
    respond_to do |format|
      if @skull.update(skull_params)
        format.html { redirect_to @skull, notice: 'Skull was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @skull.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skulls/1
  # DELETE /skulls/1.json
  def destroy
    @skull.destroy
    respond_to do |format|
      format.html { redirect_to skulls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skull
      @skull = Skull.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skull_params
      params.require(:skull).permit(:merchant_id, :merchant_account_id, :skull, :description)
    end
end
