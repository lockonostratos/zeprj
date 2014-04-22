class ProductsController < ApplicationController
  before_action :set_merchant_warehouse_product, only: [:show, :edit, :update, :destroy]

  # GET /merchant_warehouse_products
  # GET /merchant_warehouse_products.json
  def index
    @products = Product.all
  end

  # GET /merchant_warehouse_products/1
  # GET /merchant_warehouse_products/1.json
  def show
  end

  # GET /merchant_warehouse_products/new
  def new
    @product = Product.new
  end

  # GET /merchant_warehouse_products/1/edit
  def edit
  end

  # POST /merchant_warehouse_products
  # POST /merchant_warehouse_products.json
  def create
    @product = Product.new(merchant_warehouse_product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Merchant warehouse product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchant_warehouse_products/1
  # PATCH/PUT /merchant_warehouse_products/1.json
  def update
    respond_to do |format|
      if @product.update(merchant_warehouse_product_params)
        format.html { redirect_to @product, notice: 'Merchant warehouse product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchant_warehouse_products/1
  # DELETE /merchant_warehouse_products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to merchant_warehouse_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant_warehouse_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_warehouse_product_params
      params.require(:product).permit(:product_code, :skull_code, :merchant_warehouse, :name, :qualtiy_all, :price)
    end
end
