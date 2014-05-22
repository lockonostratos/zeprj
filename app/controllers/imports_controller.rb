class ImportsController < MerchantApplicationController
  before_action :set_import, only: [:show, :edit, :update, :destroy]

  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all
    respond_to do |format|
      format.html
      format.json { render :json => @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @import }
    end
  end

  # GET /imports/new
  def new
    @import = Import.new
  end

  # GET /imports/1/edit
  def edit
  end

  # POST /imports
  # POST /imports.json
  def create
    #Tạo phiếu Import
    @import = Import.new(import_params)
    # Mặc định merchant_account_id
    @import.merchant_account_id = current_merchant_account.id
    #kiểm tra xem có quyền truy cập với warehouse_id hay ko, nếu có thì = true
     if check_warehouse_permission(@import.warehouse_id) == true
        # Nếu Export == nill, tức là nhập hàng mới, khác nil là chuyển kho
        if @import.export==nil
        @import.save
          Product.transaction do
            TempProduct.where(:warehouse_id => @import.warehouse_id,
                              :merchant_account_id => current_merchant_account.id).each do |temp_product|
              new_products=[
                  :product_code =>temp_product.product_code,
                  :skull_id=>temp_product.skull_id,
                  :provider_id=>temp_product.provider_id,
                  :warehouse_id=>temp_product.warehouse_id,
                  :import_id=>Import.last.id, :name=>temp_product.name,
                  :import_quality=>temp_product.import_quality,
                  :available_quality=>temp_product.import_quality,
                  :instock_quality=>temp_product.import_quality,
                  :import_price=>temp_product.import_price,
                  :expire=>temp_product.expire]
              #add moi product
              Product.create(new_products)
              #cong quality vao bang ProductSummary
              @new=ProductSummary.find_by_product_code(temp_product.product_code)
              @new.update!(:quality=>(@new.quality + temp_product.import_quality))

              #xoa product trong bang tam TempProduct
              temp_product.destroy
            end
          end
          # save Import với chuyển hàng từ kho qua kho với Export_id có hay ko
        elsif Export.find_by_id(@import.export) != nil
          @import.save
        else #TODO Xử lý thông báo lỗi dữ liệu khi Export_id không tồn tại
        end
     else #TODO Xử lý thông báo khi warehouse_id sai
     end
  end





  # PATCH/PUT /imports/1
  # PATCH/PUT /imports/1.json
  def update
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    #Chỉ xóa được khi Import rỗng
    if Product.find_by_import_id(@import.id) != nil
      @import.destroy
      respond_to do |format|
        format.html { redirect_to imports_url }
        format.json { head :no_content }
      end
    else #TODO Xử lý thông báo khi không xóa đươc
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_import
      @import = Import.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def import_params
      params.require(:import).permit(:warehouse_id, :merchant_account_id, :export, :description)
    end
end
