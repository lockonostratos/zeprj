class OrdersController < MerchantApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    respond_to do |format|
      format.html
      format.json { render :json => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @order }
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    # @order = Order.new(product_params)
    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @current_order, notice: 'Order was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @current_order }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @current_order.errors, status: :unprocessable_entity }
    #   end
    # end

    #TODO: Giả lập dữ liệu nhận. Xóa mấy cái này khi viết xong
    selling_stocks = ProductSummary.find(8,9) #id, soluong....
    dump_quality = 20
    # transaction_error = false;

    #pseduo
    #-----Tạo hóa đơn bán hàng!--->
    #Nhận: Mảng các sản phẩm [stockSummary]
    #1.Tạo hóa đơn mới
    @current_order = Order.new(order_params)
    @current_order.total_price=0
    @current_order.deposit=0
    @current_order.discount_cash=0
    @current_order.final_price=0
    @current_order.payment_method=0
    @current_order.status=0
    @current_order.save

    #2.Kiểm tra trường hợp số lượng không đủ bán [stockSummary] -> trả về lỗi!
    selling_check_quality_before_sale selling_stocks, dump_quality

    #3.Bởi vì số lượng là hợp lý, thực hiện bán hàng, trừ số lượng tồn kho:
    #   Có 2 trường hợp:
    #     Nếu [dilivery=true] thì trừ khả dĩ [available_quality].
    #     Nếu [dilivery=false] thì trừ cả 2 khả dĩ [available_quality] và thực tế [instock_quality]
    #   Bởi vì hàng bán ra thực tế nằm trong bản [stock] không phải [stockSummary] nên, phải *trừ theo đợt
    #   (ví dụ có 2 đợt nhập cùng sản phẩm - và số lượng bán vượt qua một đợt thì sẽ phải trừ cả 2 đợt để cho đủ số sản phẩm)
    selling_stocks.each do |item|
      stocking_items = Product.where(product_code: item.product_code, skull_id: nil, warehouse_id: item.warehouse_id)
                              .where('available_quality > ?', 0)

      #Trừ số lượng sản phẩm trong bảng Product
      #Nếu như không giao hàng (bán luôn lúc đó) thì trừ số lượng
      if @current_order.delivery == false
        subtract_quality_on_direct_sale stocking_items, item, @current_order, dump_quality
      else #TODO Tạo phiếu giao hàng (chưa nhận được dữ liệu)
        #Chỉ tạo phiếu hàng nếu như chức năng trừ kho được thực hiện đúng!
        Delivery.create!(
             :order_id=>@current_order.id,
             :merchant_account_id=>current_merchant_account.id,
             :success=>false,
             :creation_date=>@current_order.created_at,
             :delivery_date=>@current_order.updated_at,
             :delivery_address=>'Ho Chi Minh',
             :contact_name=>'Sang',
             :contact_phone=>'0123456789',
             :transportation_fee=>200,
             :comment=>'Giao Hang Tan Noi',
             :status=>1
        ) if subtract_quality_on_dilivery_sale stocking_items, item, @current_order, dump_quality

      end
    #4.Cập nhật hóa đơn.
    #   1.Thêm các record vào bảng [OrderDetails] với id của hóa đơn đang tạo! (tức là thêm chi tiết vào cho hóa đơn)
    #   2.Cập nhật các số liệu khác: tổng tiền, giảm giá...
      @current_order.final_price += (item.price * dump_quality)
    end
    @current_order.save





  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:branch_id, :warehouse_id, :merchant_account_id, :customer_id, :return, :delivery, :total_price, :deposit, :discount_cash, :final_price, :payment_method, :status)
    end

    #Kiểm tra số lượng tồn kho so vớ số lượng bán, trên bảng ProductSummary
    def selling_check_quality_before_sale(product_array, dump_quality)
      product_array.each do |item|
        if ProductSummary.find_by_id(item.id).quality < dump_quality #item.buying_quality
          #TODO: gửi về lỗi chi tiết trên từng sản phẩm, cái nào thiếu bao nhiêu!
          flash.now.alert = 'So luong ton kho hien tai khong du!'
          render 'new'
        end
      end
    end

    def subtract_quality_on_dilivery_sale (stocking_items, selling_item, current_order, dump_quality)
      subtract_quality_on_sale stocking_items, selling_item, current_order, dump_quality
    end

    def subtract_quality_on_direct_sale (stocking_items, selling_item, current_order, dump_quality)
      subtract_quality_on_sale stocking_items, selling_item, current_order, dump_quality, true
    end

    def subtract_quality_on_sale (stocking_items, selling_item, current_order, dump_quality, is_direct_sale = true)
    transactioned_quality = 0

    stocking_items.each do |stock|
      #số lượng còn phải lấy = là số lượng tổng - số lượng đã lấy
      required_quality = dump_quality - transactioned_quality
      #Nếu như số lượng cần lấy [stock.available_quality] có đủ trong kho,
      #Nếu đợt hàng có đủ s.phẩm thì lấy đúng số lượng cần lấy, không đủ thì lấy hết những gì đang có của đợt sp!
      takken_quality = stock.available_quality > required_quality ? required_quality : stock.available_quality

      #Tạo mới chi tiết đơn hàng với số lượng đã lấy [takken_quality]
      OrderDetail.create!(
          :order_id=> current_order.id,
          :product_id=> stock.id,
          :quality=> takken_quality,
          :price=> stock.import_price,
          :discount_cash=>0
      )

      #trừ số lượng khả dĩ và số lượng tồn thực tế!
      stock.available_quality -= takken_quality
      stock.instock_quality -= takken_quality if is_direct_sale
      stock.save()

      #Cộng dồn số lượng của đợt trước (nếu có) với số lượng vừa lấy khỏi kho!
      transactioned_quality += takken_quality

      #Nếu như đủ hàng (takken_quality == dump_quality),ngừng lấy thêm từ các record phía sau => kết thúc vòng lặp!
      if transactioned_quality == dump_quality then break end
    end

    #Cập nhật trừ sản phẩm vào bảng ProductSummary
    selling_item.quality -= dump_quality
    selling_item.save

    return transactioned_quality == dump_quality
  end
end
