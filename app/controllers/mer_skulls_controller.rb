class MerSkullsController < ApplicationController
  before_action :set_mer_skull, only: [:show, :edit, :update, :destroy]

  # GET /mer_skulls
  # GET /mer_skulls.json
  def index
    @mer_skulls = MerSkull.all
  end

  # GET /mer_skulls/1
  # GET /mer_skulls/1.json
  def show
  end

  # GET /mer_skulls/new
  def new
    @mer_skull = MerSkull.new
  end

  # GET /mer_skulls/1/edit
  def edit
  end

  # POST /mer_skulls
  # POST /mer_skulls.json
  def create
    @mer_skull = MerSkull.new(mer_skull_params)

    respond_to do |format|
      if @mer_skull.save
        format.html { redirect_to @mer_skull, notice: 'Mer skull was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mer_skull }
      else
        format.html { render action: 'new' }
        format.json { render json: @mer_skull.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mer_skulls/1
  # PATCH/PUT /mer_skulls/1.json
  def update
    respond_to do |format|
      if @mer_skull.update(mer_skull_params)
        format.html { redirect_to @mer_skull, notice: 'Mer skull was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mer_skull.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mer_skulls/1
  # DELETE /mer_skulls/1.json
  def destroy
    @mer_skull.destroy
    respond_to do |format|
      format.html { redirect_to mer_skulls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mer_skull
      @mer_skull = MerSkull.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mer_skull_params
      params.require(:mer_skull).permit(:mer_id, :skull_code, :description)
    end
end
