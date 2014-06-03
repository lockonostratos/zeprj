class InventoriesController < AccountsController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all
    respond_to do |format|
      format.html
      format.json { render :json => @inventories }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @inventory }
    end
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)
    #1. Kiem tra phiếu trước ok hay chua neu chua ok thì quay lai làm cho ok moi dc tao phieu moi
    temp_inventory = Inventory.where(warehouse_id: @inventory.warehouse_id, merchant_account_id: @inventory.merchant_account_id)
    check = true
    temp_inventory.each do |temp|
      check = temp.submited
      break if !check # check == false

    end
    respond_to do |format|
      if check
        if @inventory.save
          #2. add tat ca product vao bang tam
          Product.where(:warehouse_id => @inventory.warehouse_id).each do |product|
              temp_inventory = TempInventoryDetail.new(
                  :product_id=>product.id,
                  :inventory_id=>@inventory.id,
                  :original_quality=>product.instock_quality,
                  :real_quality=>0,
                  :submited=>0)
              if product.instock_quality >0
                temp_inventory.save
              end

          end

        end
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inventory }
      else
        format.html { render action: 'new' }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update

    # 0 Nhận thông tin từ Clienl------------------------------------------------------------>
    @inventory.attributes = (inventory_params)
    inventory = Inventory.find(@inventory.id)
    #1 Kiểm tra quyền truy cập nếu nhân viên, quản lý , khách----------------------------------->

    #2.Xử lý nếu là quyền truy cập là khách lạ-------------------------------------------------------->

    #3.Xử lý nếu là quyền truy cập là quản lý-------------------------------------------------------->
    # if temp_inventory.submited == true and temp_inventory.success == false and temp_inventory.resolved == false and @inventory.submited == true and @inventory.resolved == true and @inventory.success == false
    # end

    #4.Xử lý nếu là quyền truy cập là nhân viên-------------------------------------------------------->
      if inventory.submited == false and inventory.success == false and inventory.resolved == false and @inventory.submited == true and @inventory.resolved == false and @inventory.success == false
      #Kiểm tra bảng temp_inventory_detail mọi hàng hóa submited = true
        #lấy tất cả thong tin từ bảng TempInventoryDetail
        temp_inventory = TempInventoryDetail.where(inventory_id:@inventory.id)
        submmited = true
        #kiểm tra temp_inventory đã submited chưa
        temp_inventory.each do |temp|
          if temp.submited == false then submmited = false end
        end
        if submmited == false
        # thông báo lỗi chưa kiểm tra hết kho hàng
          respond_to do |format|
            format.html { redirect_to @inventory, notice: 'Loi chua kiem tra het kho hang' }
            format.json { render action: 'show', status: :created, location: @inventory }
          end
        end
      #Tạo các InventoryDetail
        temp_inventory.each do |temp|
          if temp.original_quality > temp.real_quality
            InventoryDetail.create!(
                :product_id=>temp.product_id,
                :inventory_id=>temp.inventory_id,
                :original_quality=>temp.original_quality,
                :real_quality=>temp.real_quality,
                :sale_quality=> temp.quality,
                :resolved=>false)
          end
      #Xóa dữ liệu trong bảng temp_inventory_detail
          temp.destroy
        end
      #Cập nhật inventory.submited = true
        @inventory.save()
      else
        #thông báo lỗi thông tin inventory ko chính xác
        respond_to do |format|
          format.html { redirect_to @inventory, notice: 'Thong tin khong chinh xac' }
          format.json { render action: 'show', status: :created, location: @inventory }
        end
      end







  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:id, :warehouse_id, :merchant_account_id, :submited, :decription, :success, :resolved, :resolve_description)
    end
end
