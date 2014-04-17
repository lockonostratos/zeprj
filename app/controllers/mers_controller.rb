class MersController < ApplicationController
  before_action :set_mer, only: [:show, :edit, :update, :destroy]

  # GET /mers
  # GET /mers.json
  def index
    @mers = Mer.all
  end

  # GET /mers/1
  # GET /mers/1.json
  def show
  end

  # GET /mers/new
  def new
    @mer = Mer.new
  end

  # GET /mers/1/edit
  def edit
  end

  # POST /mers
  # POST /mers.json
  def create
    @mer = Mer.new(mer_params)

    respond_to do |format|
      if @mer.save
        format.html { redirect_to @mer, notice: 'Mer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mer }
      else
        format.html { render action: 'new' }
        format.json { render json: @mer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mers/1
  # PATCH/PUT /mers/1.json
  def update
    respond_to do |format|
      if @mer.update(mer_params)
        format.html { redirect_to @mer, notice: 'Mer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mers/1
  # DELETE /mers/1.json
  def destroy
    @mer.destroy
    respond_to do |format|
      format.html { redirect_to mers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mer
      @mer = Mer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mer_params
      params.require(:mer).permit(:head, :name)
    end
end
