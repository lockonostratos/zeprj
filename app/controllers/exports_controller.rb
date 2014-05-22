class ExportsController < ApplicationController
  before_action :set_export, only: [:show, :edit, :update, :destroy]

  # GET /exports
  # GET /exports.json
  def index
    @exports = Export.all
    respond_to do |format|
      format.html
      format.json { render :json => @exports }
    end
  end

  # GET /exports/1
  # GET /exports/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @export }
    end
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

           Import.create(
               :warehouse_id=>@export.target_warehouse_id,
               :merchant_account_id=>@export.merchant_account_id,
               :export=>@export.id,
               :description=> "adasdasd"
           )

          names = [1,2,4,5]

              names.each do |name|
                  @name = ExportDetail.create(:export_id => @export.id, :product_id=>name, :quality=>50)
                  @name.save

                  @pro=Product.find(name)
                  @current_product = ProductSummary.where(:product_code => @pro.product_code, :skull_id => @pro.skull_id, :warehouse_id => Import.last.warehouse_id)
                  #  Add san pham vao ProductSummary
                  if @current_product.first==nil #neu chua co
                    #tao san pham moi
                    @pro_sum = ProductSummary.new(
                        :product_code=>@pro.product_code,
                        :skull_id=>@pro.skull_id,
                        :warehouse_id=>Import.last.warehouse_id,
                        :merchant_account_id=>current_account.id,
                        :name=>@pro.name,
                        :quality=>50,
                        :price=>@pro.import_price)
                    @pro_sum.save
                  else
                    #neu co cap nhat so luong
                    ProductSummary.where(
                        :product_code => @pro.product_code,
                        :skull_id => @pro.skull_id,
                        :warehouse_id=>Import.last.warehouse_id
                    )
                    .each do |ex|
                      new=[:id=>ex.id]
                      ProductSummary.update(ex.id,quality:(ProductSummary.find(ex.id).quality + 50))
                    end
                  end
                  #trừ sản phẩm trong bảng ProductSummary chuyển
                  ProductSummary.where(
                      :product_code => @pro.product_code,
                      :skull_id => @pro.skull_id,
                      :warehouse_id=>@pro.warehouse_id
                  )
                  .each do |ex|
                    new=[:id=>ex.id]
                    ProductSummary.update(ex.id,quality:(ProductSummary.find(ex.id).quality - 50))
                  end

                  # trừ sản phẩm của warehouse chuyen
                  @pro.update!(:available_quality=>(@pro.available_quality - 50), :instock_quality=>(@pro.instock_quality - 50))


                  # Tim Product dua theo ExportDetail
                  Product.create!(
                      :product_code=>@pro.product_code,
                      :skull_id=>@pro.skull_id,
                      :warehouse_id=>Import.last.warehouse_id,
                      :provider_id=>@pro.provider_id,
                      :import_id=>Import.last.id,
                      :name=>@pro.name,
                      :import_quality=>50,#lay tu quality cua Export
                      :available_quality=>50,
                      :instock_quality=>50,
                      :import_price=>@pro.import_price,#lay tu price cua Product
                      :expire=>@pro.expire)

              end
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
