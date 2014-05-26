class MetroSummariesController < ApplicationController
  before_action :set_metro_summary, only: [:show, :edit, :update, :destroy]

  # GET /metro_summaries
  # GET /metro_summaries.json
  def index
    @metro_summaries = MetroSummary.all
  end

  # GET /metro_summaries/1
  # GET /metro_summaries/1.json
  def show
  end

  # GET /metro_summaries/new
  def new
    @metro_summary = MetroSummary.new
  end

  # GET /metro_summaries/1/edit
  def edit
  end

  # POST /metro_summaries
  # POST /metro_summaries.json
  def create
    @metro_summary = MetroSummary.new(metro_summary_params)

    respond_to do |format|
      if @metro_summary.save
        format.html { redirect_to @metro_summary, notice: 'Metro summary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @metro_summary }
      else
        format.html { render action: 'new' }
        format.json { render json: @metro_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metro_summaries/1
  # PATCH/PUT /metro_summaries/1.json
  def update
    respond_to do |format|
      if @metro_summary.update(metro_summary_params)
        format.html { redirect_to @metro_summary, notice: 'Metro summary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @metro_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metro_summaries/1
  # DELETE /metro_summaries/1.json
  def destroy
    @metro_summary.destroy
    respond_to do |format|
      format.html { redirect_to metro_summaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metro_summary
      @metro_summary = MetroSummary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metro_summary_params
      params.require(:metro_summary).permit(:warehouse_id, :product_count, :stock_count, :customer_count, :staff_count, :sale_count, :sale_count_day, :sale_count_month, :return_count, :return_count_day, :return_count_month, :revenue, :revenue_day, :revenue_month)
    end
end
