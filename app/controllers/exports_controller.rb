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

    respond_to do |format|
      if @export.save
        format.html { redirect_to @export, notice: 'Export was successfully created.' }
        format.json { render action: 'show', status: :created, location: @export }
      else
        format.html { render action: 'new' }
        format.json { render json: @export.errors, status: :unprocessable_entity }
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
