class TempInventoryDetailsController < ApplicationController
  before_action :set_temp_inventory_detail, only: [:show, :edit, :update, :destroy]

  # GET /temp_inventory_details
  # GET /temp_inventory_details.json
  def index
    @temp_inventory_details = TempInventoryDetail.all
  end

  # GET /temp_inventory_details/1
  # GET /temp_inventory_details/1.json
  def show
  end

  # GET /temp_inventory_details/new
  def new
    @temp_inventory_detail = TempInventoryDetail.new
  end

  # GET /temp_inventory_details/1/edit
  def edit
  end

  # POST /temp_inventory_details
  # POST /temp_inventory_details.json
  def create
    @temp_inventory_detail = TempInventoryDetail.new(temp_inventory_detail_params)

    respond_to do |format|
      if @temp_inventory_detail.save
        format.html { redirect_to @temp_inventory_detail, notice: 'Temp inventory detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @temp_inventory_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @temp_inventory_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_inventory_details/1
  # PATCH/PUT /temp_inventory_details/1.json
  def update
    respond_to do |format|
      if @temp_inventory_detail.update(temp_inventory_detail_params)
        format.html { redirect_to @temp_inventory_detail, notice: 'Temp inventory detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @temp_inventory_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_inventory_details/1
  # DELETE /temp_inventory_details/1.json
  def destroy
    @temp_inventory_detail.destroy
    respond_to do |format|
      format.html { redirect_to temp_inventory_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_inventory_detail
      @temp_inventory_detail = TempInventoryDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temp_inventory_detail_params
      params.require(:temp_inventory_detail).permit(:product_id, :inventory, :original_quality, :real_quality, :quality)
    end
end
