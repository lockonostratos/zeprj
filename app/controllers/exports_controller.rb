class ExportsController < ApplicationController
  before_action :set_export, only: [:show, :edit, :update, :destroy]

  # GET /exports
  # GET /exports.json
  def index
    @exports = Export.all
  end

  # GET /exports/1
  # GET /exports/1.json
  def show
  end

  # GET /exports/new
  def new
    @export = Export.new
  end

  # GET /exports/1/edit
  def edit
  end

  # POST /exports
  # POST /exports.json
  def create
    @export = Export.new(export_params)
     ExportDetail.transaction do
        respond_to do |format|
          if @export.save
            format.html { redirect_to @export, notice: 'Export was successfully created.' }
            format.json { render action: 'show', status: :created, location: @export }
          # Add Import khi chuyen
           Import.create!(:warehouse_id=>@export.target_warehouse_id, :merchant_account_id=>@export.merchant_account_id, :export=>Export.last.id, :description=>'asdasdasdasdasd')
          #Tao ExportDetail
          ExportDetail.create(:export_id=>Export.last.id, :product_id=>1, :quality=>30)
          ExportDetail.create(:export_id=>Export.last.id, :product_id=>2, :quality=>30)

          # Tao san pham moi
          @pro=Product.find(1)
          Product.create!(
              :product_code=>@pro.product_code,
              :skull_id=>@pro.skull_id,
              :warehouse_id=>Import.last.warehouse_id,
              :provider_id=>@pro.provider_id,
              :import_id=>Import.last.id,
              :name=>@pro.name,
              :import_quality=>30,
              :available_quality=>30,
              :instock_quality=>30,
              :import_price=>2000,
              :expire=>@pro.expire)

          @current_product = ProductSummary.where(:product_code => @pro.product_code, :skull_id => @pro.skull_id)

          #  Add san pham vao ProductSummary
          if @current_product.first==nil
            #cap nhat productsummary
            ProductSummary.create!(
                :product_code=>@pro.product_code,
                :skull_id=>@pro.skull_id,
                :warehouse_id=>Import.last.warehouse_id,
                :merchant_account_id=>current_account.id,
                :name=>@pro.skull_id,
                :quality=>3000, :price=>2000)
          else
            #Add moi neu chua co
            ProductSummary.where(
                :product_code => @pro.product_code,
                :skull_id => @pro.skull_id)
              .each do |ex|
                new=[:id=>ex.id]
                ProductSummary.update(ex.id,quality:300)
            end
          end
           # trừ sản phẩm của warehouse chuyen
            @pro.update!(:available_quality=>(@pro.available_quality + 30), :instock_quality=>(@pro.instock_quality + 30))



          else
            format.html { render action: 'new' }
            format.json { render json: @export.errors, status: :unprocessable_entity }
          end
        end
      end
  end

  # PATCH/PUT /exports/1
  # PATCH/PUT /exports/1.json
  def update
    respond_to do |format|
      if @export.update(export_params)
        format.html { redirect_to @export, notice: 'Export was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @export.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exports/1
  # DELETE /exports/1.json
  def destroy
    @export.destroy
    respond_to do |format|
      format.html { redirect_to exports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_export
      @export = Export.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def export_params
      params.require(:export).permit(:merchant_account_id, :warehouse_id, :target_warehouse_id, :description)
    end
end
