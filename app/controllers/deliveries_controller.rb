class DeliveriesController < MerchantApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.where(order_id: all_order_on_merchant(current_merchant_account.merchant_id))
    respond_to do |format|
      format.html
      format.json { render :json => @deliveries}
    end
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @delivery }
    end
  end

  # GET /deliveries/new
  def new
    @delivery = Delivery.new
  end

  # GET /deliveries/1/edit
  def edit
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)

    respond_to do |format|
      if @delivery.save
        format.html { redirect_to @delivery, notice: 'Delivery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @delivery }
      else
        format.html { render action: 'new' }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    @delivery.attributes = (delivery_params)
    delivery = Delivery.find(@delivery.id)
    respond_to do |format|
      if delivery.success == true || @delivery.success == false
        format.html { redirect_to @delivery, notice: 'Ko the success' }
        format.json { head :no_content }
      end

      if @delivery.success==true
        order = Order.find(@delivery.order_id)
        order_detail = OrderDetail.where(order_id:order.id)
        products = Product.where(id:order_detail.pluck(:product_id))

        #Cap nhat stock_count, sale_count, sale_count_day, sale_count_month vao MetroSummary
        metro_summary = MetroSummary.find_by_warehouse_id(order.warehouse_id)
        order_detail.each do |order|
          product = products.find(order.product_id.to_param)
          product.instock_quality = product.instock_quality - order.quality
          product.save()
          #Cong san pham vao bang MetroSummary
          metro_summary.stock_count -= order.quality
          metro_summary.sale_count += order.quality
          metro_summary.sale_count_day += order.quality
          metro_summary.sale_count_month += order.quality
          metro_summary.revenue +=(order.quality * order.price)
          metro_summary.revenue_day +=(order.quality * order.price)
          metro_summary.revenue_month +=(order.quality * order.price)
        end
        # Cap Nhat Bang MetroSummary
        metro_summary.save()
        #Cap nhat order
        order.save(:status=>2)
        @delivery.save()
      end
      format.html { redirect_to @delivery, notice: 'ok' }
      format.json { head :no_content }
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery.destroy
    respond_to do |format|
      format.html { redirect_to deliveries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_params
      params.require(:delivery).permit(:order_id, :merchant_account_id, :success, :creation_date, :delivery_date, :delivery_address, :contact_name, :contact_phone, :transportation_fee, :comment, :status)
    end
end
