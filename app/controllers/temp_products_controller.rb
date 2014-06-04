class TempProductsController < MerchantApplicationController
  before_action :set_temp_product, only: [:show, :edit, :update, :destroy]

  # GET /temp_products
  # GET /temp_products.json
  def index
    @temp_products =  TempProduct.where(:merchant_account_id => current_merchant_account.id)
    product_summary = ProductSummary.where(id:@temp_products.pluck(:product_summary_id))
    temp_products_detail = []
    @temp_products.each do |ex|
      current_product_summary = product_summary.find(ex.product_summary_id)
      params = ActionController::Parameters.new({
                                                    temp_products_detail: {
                                                        id: ex.id,
                                                        product_summary_id: ex.product_summary_id,
                                                        merchant_account: ex.merchant_account_id,
                                                        import_quality:ex.import_quality,
                                                        import_price:ex.import_price,
                                                        provider: ex.provider_id,
                                                        warehouse: current_product_summary.warehouse_id,
                                                        price:current_product_summary.price,
                                                        quality:current_product_summary.quality,
                                                        product_code: current_product_summary.product_code,
                                                        skull: current_product_summary.skull_id,
                                                        name: current_product_summary.name
                                                    }
                                                })
      permitted = params.require(:temp_products_detail).permit(
                                                               :id,
                                                               :product_summary_id,
                                                               :merchant_account,
                                                               :warehouse,
                                                               :provider,
                                                               :product_code,
                                                               :skull,
                                                               :name,
                                                               :price,
                                                               :quality,
                                                               :import_price,
                                                               :import_quality
                                                               )
      temp_products_detail += [permitted]
    end
    respond_to do |format|
      format.html
      format.json { render :json => temp_products_detail }
    end
  end

  # GET /temp_products/1
  # GET /temp_products/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @temp_product}
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
        format.json { render json: return_json_temp_product(@temp_product)}
      else
        format.html { render action: 'new' }
        format.json { render json: {errors: @temp_product.errors } }
      end
    end
  end

  # PATCH/PUT /temp_products/1
  # PATCH/PUT /temp_products/1.json
  def update
    @temp_product.attributes = (temp_product_params)
    respond_to do |format|
      if @temp_product.save()
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
      params.require(:temp_product).permit(:product_summary_id, :provider_id, :warehouse_id, :merchant_account_id, :import_quality, :import_price)
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
  def return_json_temp_product (temp_product)
    current_product_summary = ProductSummary.find(temp_product.product_summary_id)
    params = ActionController::Parameters.new({
                                                  temp_products_detail: {
                                                      id: temp_product.id,
                                                      product_summary_id: temp_product.product_summary_id,
                                                      merchant_account: temp_product.merchant_account_id,
                                                      import_quality:temp_product.import_quality,
                                                      import_price:temp_product.import_price,
                                                      provider: temp_product.provider_id,
                                                      warehouse: current_product_summary.warehouse_id,
                                                      price:current_product_summary.price,
                                                      quality:current_product_summary.quality,
                                                      product_code: current_product_summary.product_code,
                                                      skull: current_product_summary.skull_id,
                                                      name: current_product_summary.name
                                                  }
                                              })
    permitted = params.require(:temp_products_detail).permit(
        :id,
        :product_summary_id,
        :merchant_account,
        :warehouse,
        :provider,
        :product_code,
        :skull,
        :name,
        :price,
        :quality,
        :import_price,
        :import_quality
    )
    return [permitted]
  end
end