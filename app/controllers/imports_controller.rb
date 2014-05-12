class ImportsController < MerchantApplicationController
  before_action :set_import, only: [:show, :edit, :update, :destroy]

  # GET /imports
  # GET /imports.json
  def index
    @imports = Import.all
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
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
    respond_to do |format|
      if @import.save
        format.html { redirect_to @import, notice: 'Import was successfully created.' }
        format.json { render action: 'show', status: :created, location: @import }
            if @import.export==nil #TODO chưa bắt dc import rỗng
                #Product.transaction do
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
                    #temp_product.destroy
                  end
                #end
            else
              @import.destroy
            end

      else
        format.html { render action: 'new' }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end

  end





  # PATCH/PUT /imports/1
  # PATCH/PUT /imports/1.json
  def update
    respond_to do |format|
      if @import.update(import_params)
        format.html { redirect_to @import, notice: 'Import was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url }
      format.json { head :no_content }
    end
  end

  def save_temporary_of

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
