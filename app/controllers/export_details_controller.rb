class ExportDetailsController < MerchantApplicationController
  before_action :set_export_detail, only: [:show, :edit, :update, :destroy]

  # GET /export_details
  # GET /export_details.json
  def index
    @export_details = ExportDetail.all
    respond_to do |format|
      format.html
      format.json { render :json => @export_details }
    end
  end

  def show_export_details_on_export(export)
    @export_details = ExportDetail.where(export_id: export)
    respond_to do |format|
      format.html
      format.json { render :json => @export_details }
    end
  end

  # GET /export_details/1
  # GET /export_details/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @export_detail }
    end
  end

  # GET /export_details/new
  def new
    @export_detail = ExportDetail.new
  end

  # GET /export_details/1/edit
  def edit
  end

  # POST /export_details
  # POST /export_details.json
  def create
    @export_detail = ExportDetail.new(export_detail_params)
    respond_to do |format|
      if @export_detail.save
        format.html { redirect_to @export_detail, notice: 'Export detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @export_detail }

      else
        format.html { render action: 'new' }
        format.json { render json: @export_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /export_details/1
  # PATCH/PUT /export_details/1.json
  def update
    respond_to do |format|
      if @export_detail.update(export_detail_params)
        format.html { redirect_to @export_detail, notice: 'Export detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @export_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /export_details/1
  # DELETE /export_details/1.json
  def destroy
    @export_detail.destroy
    respond_to do |format|
      format.html { redirect_to export_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_export_detail
      @export_detail = ExportDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def export_detail_params
      params.require(:export_detail).permit(:export_id, :product_id, :quality)
    end
end
