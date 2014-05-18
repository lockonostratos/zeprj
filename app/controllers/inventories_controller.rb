class InventoriesController < AccountsController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all
    respond_to do |format|
      format.html { redirect_to imports_url }
      format.json { render :json => @inventories }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    respond_to do |format|
      format.html { redirect_to imports_url }
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

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inventory }

        #2. add tat ca product vao bang tam
        Product.transaction do
          @a=Product.where(:warehouse_id => @inventory.warehouse_id).each do |product|
            @temp_inventory = TempInventoryDetail.new(
                :product_id=>product.id,
                :inventory_id=>@inventory.id,
                :original_quality=>product.instock_quality,
                :real_quality=>0)
            @temp_inventory.save
          end
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      @temp = Inventory.new(inventory_params)
      inventory_submmited = Inventory.find(@temp.id).submited == false
      inventory_success = Inventory.find(@temp.id).success == false
      inventory_resolved = Inventory.find(@temp.id).resolved == false
      temp_submmited = @temp.submited == true
      temp_resolved = @temp.resolved == false
      temp_success = @temp.success == false

      #cập nhật lần đầu tiên của nhân viên kiểm kho
      if inventory_submmited and inventory_resolved and inventory_success
        if temp_submmited and temp_resolved and temp_success
          @temp_inventory = TempInventoryDetail.find_all_by_inventory_id(@temp.id)
          #kiểm tra bảng tạm cập nhật sản phẩm nếu ok thi true
          cheack_all=true
            @temp_inventory.each do |temp|
                if temp.updated_at == temp.created_at
                  cheack_all=false
                end
              end
          #save vào bảng InventoryDetail
            if cheack_all=true
              @temp_inventory.each do |temp|
                if temp.original_quality > temp.real_quality
                  InventoryDetail.create!(
                      :product_id=>temp.product_id,
                      :inventory_id=>temp.inventory_id,
                      :original_quality=>temp.original_quality,
                      :real_quality=>temp.real_quality,
                      :sale_quality=> temp.quality,
                      :resolved=>false
                  )
                end
                 temp.destroy
              end
            end
          #cập nhật phiếu kiểm kho
          @inventory.update(inventory_params)
          format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
          format.json { head :no_content }
        end

        #cập nhật lần 2 khi Quản lý kiểm duyệt lại phiếu kiểm kho
        inventory_submmited = Inventory.find(@temp.id).submited == true
        inventory_success = Inventory.find(@temp.id).success == false
        inventory_resolved = Inventory.find(@temp.id).resolved == false
        temp_submmited = @temp.submited == true
        temp_resolved = @temp.resolved == true
        temp_success = @temp.success == false
      elsif inventory_submmited and inventory_success and inventory_resolved
        if temp_submmited and temp_resolved and temp_success

        end

      else
        format.html { render action: 'edit' }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
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
