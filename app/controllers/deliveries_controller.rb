class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [:show, :edit, :update, :destroy]

  # GET /deliveries
  # GET /deliveries.json
  def index
    @deliveries = Delivery.all
    respond_to do |format|
      format.html
      format.json { render :json => @deliveries }
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
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
        format.json { head :no_content }
        #TODO cap nhat neu Delivery ok
        if @delivery.success==true
          @order = OrderDetail.find_by_order_id(@delivery.order_id)
          @order.each do |order|
           @product = Product.find(order.product_id)
           @product.save(:instock_quality=>(@product.instock_quality - order.quality))
          end
          Order.find(@delivery.order_id).save(:status=>2)
        else# TODO Xử lý hủy đơn đặt hàng

        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
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
      params.require(:delivery).permit(:order_id, :merchant_account_id, :creation_date, :delivery_date, :delivery_address, :contact_name, :contact_phone, :transportation_fee, :comment, :status)
    end
end
