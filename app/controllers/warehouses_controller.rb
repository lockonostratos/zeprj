class WarehousesController < MerchantApplicationController
  before_action :set_warehouse, only: [:edit, :update, :destroy]

  # GET /warehouses
  # GET /warehouses.json
  def index
    @warehouses = Warehouse.all
    respond_to do |format|
      format.html
      format.json { render json: @warehouses }
    end
  end

  # GET /warehouses/1
  # GET /warehouses/1.json
  def show
    @warehouse = params[:id] == '0' ? Warehouse.find(current_merchant_account.current_warehouse_id) : Warehouse.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render json: @warehouse}
    end
  end

  # GET /warehouses/new
  def new
    @warehouse = Warehouse.new
  end

  # GET /warehouses/1/edit
  def edit
  end

  # POST /warehouses
  # POST /warehouses.json
  def create
    @warehouse = Warehouse.new(warehouse_params)
    current_branch = Branch.find_by_id(@warehouse.branch_id)
    respond_to do |format|
      #Bắt lỗi Brach phải thuộc cùng 1 Merchant với current_merchant_account
      if current_branch != nil and current_branch.merchant_id == current_merchant_account.merchant_id
      @warehouse.save
        format.html { redirect_to @warehouse, notice: 'Warehouse was successfully created.'}
        format.json { render action: 'show', status: :created, location: @warehouse }
      else
        format.html { render action: 'new' }
        format.json { render json: @warehouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warehouses/1
  # PATCH/PUT /warehouses/1.json
  def update
  respond_to do |format|
    #Kiểm tra có quyền Edit warehouse, nếu có = true
      if  check_warehouse_permission(params[:id]) == true
        #Lấy thông tin old_warehouse
        warehouse = Warehouse.find(params[:id])
        #Lấy thông tin new_warehouse
        @warehouse.attributes = (warehouse_params)
        #Xét mặc định branch
        @warehouse.branch_id = warehouse.branch_id
        @warehouse.save()

        format.html { redirect_to @warehouse, notice: 'Warehouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @warehouse, notice: 'Loi Edit Warehouse ko cung Merchant' }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /warehouses/1
  # DELETE /warehouses/1.json
  def destroy
    current_branch = Branch.find_by_id(@warehouse.branch_id)
    respond_to do |format|
      if current_branch.merchant_id == current_merchant_account.merchant_id
      @warehouse.destroy
        format.html { redirect_to warehouses_url }
        format.json { head :no_content }
      else
        format.html { redirect_to warehouses_url, notice: 'Loi Xoa WareHouse ko cung 1 Merchant' }
        format.json { head :no_content }
      end
    end
  end
  #Trả về những Warehouse mà người dùng hiện tại có quyền truy cập
  def available
    # check_warehouse_permission(params[:id])
    # render json: @warehouses
    render json: report_all_time_and_warehouse_account('order', 0, 0, "28/05/2014".to_date, "28/05/2014".to_date, nil, 1, 1, nil)

  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def warehouse_params
      params.require(:warehouse).permit(:branch_id, :name)
    end
end
