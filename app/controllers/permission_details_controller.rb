class PermissionDetailsController < ApplicationController
  before_action :set_permission_detail, only: [:show, :edit, :update, :destroy]

  # GET /permission_details
  # GET /permission_details.json
  def index
    @permission_details = PermissionDetail.all
  end

  # GET /permission_details/1
  # GET /permission_details/1.json
  def show
  end

  # GET /permission_details/new
  def new
    @permission_detail = PermissionDetail.new
  end

  # GET /permission_details/1/edit
  def edit
  end

  # POST /permission_details
  # POST /permission_details.json
  def create
    @permission_detail = PermissionDetail.new(permission_detail_params)

    respond_to do |format|
      if @permission_detail.save
        format.html { redirect_to @permission_detail, notice: 'Permission detail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @permission_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @permission_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permission_details/1
  # PATCH/PUT /permission_details/1.json
  def update
    respond_to do |format|
      if @permission_detail.update(permission_detail_params)
        format.html { redirect_to @permission_detail, notice: 'Permission detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @permission_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permission_details/1
  # DELETE /permission_details/1.json
  def destroy
    @permission_detail.destroy
    respond_to do |format|
      format.html { redirect_to permission_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission_detail
      @permission_detail = PermissionDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_detail_params
      params.require(:permission_detail).permit(:permission_id, :name)
    end
end
