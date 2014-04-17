class MerWarehousesController < ApplicationController
  before_action :set_mer_warehouse, only: [:show, :edit, :update, :destroy]

  # GET /mer_warehouses
  # GET /mer_warehouses.json
  def index
    @mer_warehouses = MerWarehouse.all
  end

  # GET /mer_warehouses/1
  # GET /mer_warehouses/1.json
  def show
  end

  # GET /mer_warehouses/new
  def new
    @mer_warehouse = MerWarehouse.new
  end

  # GET /mer_warehouses/1/edit
  def edit
  end

  # POST /mer_warehouses
  # POST /mer_warehouses.json
  def create
    @mer_warehouse = MerWarehouse.new(mer_warehouse_params)

    respond_to do |format|
      if @mer_warehouse.save
        format.html { redirect_to @mer_warehouse, notice: 'Mer warehouse was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mer_warehouse }
      else
        format.html { render action: 'new' }
        format.json { render json: @mer_warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mer_warehouses/1
  # PATCH/PUT /mer_warehouses/1.json
  def update
    respond_to do |format|
      if @mer_warehouse.update(mer_warehouse_params)
        format.html { redirect_to @mer_warehouse, notice: 'Mer warehouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mer_warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mer_warehouses/1
  # DELETE /mer_warehouses/1.json
  def destroy
    @mer_warehouse.destroy
    respond_to do |format|
      format.html { redirect_to mer_warehouses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mer_warehouse
      @mer_warehouse = MerWarehouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mer_warehouse_params
      params.require(:mer_warehouse).permit(:branche_id, :name, :location)
    end
end
