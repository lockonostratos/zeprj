class TempProductsController < ApplicationController
  before_action :set_temp_product, only: [:show, :edit, :update, :destroy]

  # GET /temp_products
  # GET /temp_products.json
  def index
    @temp_products = TempProduct.all
  end

  # GET /temp_products/1
  # GET /temp_products/1.json
  def show
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
      if @temp_product.save
        format.html { redirect_to @temp_product, notice: 'Temp product was successfully created.' }
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
    respond_to do |format|
      if @temp_product.update(temp_product_params)
        format.html { redirect_to @temp_product, notice: 'Temp product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @temp_product.errors, status: :unprocessable_entity }
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
end
