class TempProductsController < MerchantApplicationController
  before_action :set_temp_product, only: [:show, :edit, :update, :destroy]

  # GET /temp_products
  # GET /temp_products.json
  def index
    @temp_products =  TempProduct.where(:merchant_account_id => current_merchant_account.id, :warehouse_id => @current_merchant_account.current_warehouse_id)
    respond_to do |format|
      format.html
      format.json { render :json => @temp_products }
    end
  end

  # GET /temp_products/1
  # GET /temp_products/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @temp_products}
    end
  end

  # GET /temp_products/new
  def new
    @temp_product = TempProduct.new
  end

  # GET /temp_products/1/edit
  def edit
  end

  # POST /temp_products
  # POST /temp_products.json
  def create
    @temp_product = TempProduct.new(temp_product_params)
    respond_to do |format|
        # check_validate_temp_product
      if @temp_product.save
        format.html { redirect_to @temp_product, notice: 'Temp product was successfully created.'  }
        format.json { render action: 'show', status: :created, location: @temp_product }
      else
        format.html { render action: 'new' }
        format.json { render json: @temp_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_products/1
  # PATCH/PUT /temp_products/1.json
  def update
    @temp_product.attributes = (temp_product_params)
    respond_to do |format|
      if check_validate_temp_product
      @temp_product.save()
        format.html { redirect_to @temp_product, notice: 'Temp product was successfully updated.' + @errors}
        format.json { head :no_content }
      else
        #format.html { render action: 'edit'}
        #format.json { render json: @temp_product.errors, status: :unprocessable_entity }
        format.html { redirect_to @temp_product, notice: 'Loi ' + @errors}
        format.json { render action: 'show', status: :created, location: @temp_product }
      end
    end
  end

  # DELETE /temp_products/1
  # DELETE /temp_products/1.json
  def destroy
    @temp_product.destroy
    respond_to do |format|
      format.html { redirect_to temp_products_url }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_product
      @temp_product = TempProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temp_product_params
      params.require(:temp_product).permit(:product_code, :skull_id, :provider_id, :warehouse_id, :merchant_account_id, :name, :import_quality, :import_price, :expire)
    end

    #kiểm tra dữ liệu nhận thông báo khi loi, trong @errors
  def check_validate_temp_product
    warehouse = Warehouse.find_by_id(@temp_product.warehouse_id)
    product_code = ProductSummary.find_by_product_code_and_warehouse_id_and_skull_id(@temp_product.product_code, @temp_product.warehouse_id,@temp_product.skull_id)
    skull = Skull.find_by_id_and_merchant_id(@temp_product.skull_id, current_merchant_account.merchant_id)
    provider = Provider.find_by_id_and_merchant_id(@temp_product.provider_id, current_merchant_account.merchant_id)
    errors = ''
    # if warehouse == nil || (warehouse.branch.merchant_id != current_merchant_account.merchant_id)
    #   errors +='Warehouse Sai '
    # end
    if product_code == nil
      errors +='Product_Code Sai hoac Skull sai '
    end
    # if skull == nil
    #   errors +='Skull Sai '
    # end
    # if provider == nil
    #   errors +='Nha Phan Phoi Sai '
    # end
    if @temp_product.import_quality < 0
      errors +='So Luong Sai '
    end
    if @temp_product.import_price < 0
       errors +='Gia Sai '
    end
    @errors = errors
    if @errors == ''
      return true
    else
      return false
    end

  end

end