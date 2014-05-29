class ReturnsController < MerchantApplicationController
  before_action :set_return, only: [:show, :edit, :update, :destroy]

  # GET /returns
  # GET /returns.json
  def index
    @returns = Return.all
    respond_to do |format|
      format.html
      format.json { render :json => @returns }
    end
  end

  # GET /returns/1
  # GET /returns/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @return }
    end
  end

  # GET /returns/new
  def new
    @return = Return.new
  end

  # GET /returns/1/edit
  def edit
  end

  # POST /returns
  # POST /returns.json
  def create
    #Nhận: [return] là id của phiếu mua hàng cũ (phải trả hàng)
    #      Array[order_detail]
    # #TODO: Nhận dữ liệu
    # # @return = Return.new(params[:order])
    # # @return_details = params[:return_details]
    @return = Return.new(return_params)
    #
    # #TODO: Tạo dữ liệu giả lập, xóa khi test xong
    old_products = OrderDetail.where(:order_id => @return.order_id)#giả lập dữ liệu
    return_quality = 4 #số lượng trả hàng

    # #1 Kiểm tra, nếu order có tồn tại hay ko ------------------------------------------------------------------------>
    # #TODO: Nếu như đơn bán hàng không tồn tại thì trả về lỗi!
    old_order = OrderDetail.where(:order_id => @return.order_id)
      if old_order.first == nil
        flash[:notice] = 'Loi sai  Order'
        redirect_to :action => :new
      end
    #2 Kiểm tra, nếu order có tồn tại hay ko, Kiểm tra độ toàn vẹn dữ liệu return_detail
    # xem product_id có chính xác hay ko(kiểm tra trong bảng OrderdDetail)
    unless data_validation old_products, return_quality, old_order
      flash[:notice] = 'Loi sai so luong san pham ko du'
      redirect_to :action => :new
    end

    #3 Tạo Phiếu Trả Hàng --------------------------------------------------------------------------------------------->
    @return.submited = false
    @return.save()
    #4 Tạo phiếu chi tiết trả hàng, cập nhật số lượng trả hàng trong bảng OrderDetail --------------------------------->
    old_products.each do |product|
      #Tạo phiếu ReturnDetail
      ReturnDetail.create(
          :return_id=>@return.id,
          :return_product_id=>product.product_id,
          :return_quality=>return_quality,
          :type_return=>false, # Giá trị true hay false là nhận từ return_details
          :product_id=>nil,
          :quality=>nil,
          :price=>nil
      )
    end

    respond_to do |format|
      format.html
      format.json { render :json => @return }
    end

  end



  # PATCH/PUT /returns/1
  # PATCH/PUT /returns/1.json
  def update

    #Nhận thông tin
    # # @return = Return.new(params[:order])
    # # @return_details = params[:return_details]

    # Kiểm tra dữ liệu ReturnDetail.ID có hợp lệ hay ko, nếu ko đưa ra thông báo
    # if old_return_detail.pluck(:id).sort {|a,b| a <=> b} == old_return_detail.pluck(:id).sort {|a,b| a <=> b}
    #   #Kiểm tra
    #    old_return_detail
    # else #đưa ra thong bao loi
    # end

    #TODO Cập nhật phiếu trả hàng từ quản lý
    #1 Kiểm tra thông tin nhận--------------------------------->
      @return.attributes = (return_params)
      old_return_detail = ReturnDetail.where(return_id:@return.id)#giả lập dữ liệu
    #2 Kiểm tra permission
      warehouse_id = Order.find_by_id(@return.order_id).warehouse_id
    if true
    #3 Kiểm tra ID của phiếu trả hàng
      if old_return_detail == nil then end
    #4 Nếu chưa có xác nhận của Quản Lý (submited==false), báo lổi
      if @return.submited == false
        flash[:notice] = 'Loi sai chua xac nhan'
        redirect_to :action => :edit , :location => @return
      end
    #5 Cập nhật phiếu return_details và cộng hàng trả vào bảng Product và ProductSummary
      products = Product.where(id:old_return_detail.pluck(:return_product_id))
        a=[]
        products.each do |pro|
          a+=[pro.product_code]
        end
        a=a.uniq()
      product_summaries = ProductSummary.where(product_code:a)
      order_detail = OrderDetail.where(order_id:@return.order_id)
      metro_summary = MetroSummary.find_by_warehouse_id(warehouse_id)

      old_return_detail.each do |return_detail|
        #Cập nhật hàng trả vào Product
        product = products.find_by(id:return_detail.return_product_id)
        product.available_quality += return_detail.return_quality
        product.instock_quality += return_detail.return_quality

        #Cập nhật vào ProductSummary
        product_summary = product_summaries.find_by(product_code:product.product_code)
        product_summary.quality += return_detail.return_quality
        product_summary.save()

        #Cập nhật vào bảng OrderSummery
        order = order_detail.find_by(product_id:return_detail.return_product_id)
        order.return_quality += return_detail.return_quality

        #Câp nhật vào bảng MetroSummary
        metro_summary.return_count +=return_detail.return_quality
        metro_summary.return_count_day +=return_detail.return_quality
        metro_summary.return_count_month +=return_detail.return_quality

        #Trừ tiền Revenue trong bang MetroSummary
        metro_summary.revenue = metro_summary.revenue - (return_detail.return_quality * order.price)
        metro_summary.revenue_day = metro_summary.revenue -  (return_detail.return_quality * order.price)
        metro_summary.revenue_month = metro_summary.revenue -  (return_detail.return_quality * order.price)

        #save du lieu trong bang Product  va OrderDetail
        product.save()
        order.save()
      end
      #Cập nhật thông tin vào bảng MetroSummary
      metro_summary.save()

      @return.save()
    else
      flash[:notice] = 'Ko Co Quyen Truy Cap'
      redirect_to :action => :new
    end

      respond_to do |format|
        format.html { redirect_to @return, notice: 'Update' }
        format.json { render :json => @return }
      end
  end

  # DELETE /returns/1
  # DELETE /returns/1.json
  def destroy
    @return.destroy
    respond_to do |format|
      format.html { redirect_to returns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_return
      @return = Return.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def return_params
      params.require(:return).permit(:id, :order_id, :merchant_account_id, :submited, :creation_date, :comment)
    end
    #
    def data_validation(old_products,return_quality,old_order)
      # Kiểm tra độ toàn vẹn dữ liệu return_detail, -------------------------------------------------------------------->
      # xem product_id có chính xác hay ko(kiểm tra trong bảng OrderdDetail)
      old_products.each do |product|
        order = old_order.find_by product_id:product.product_id #Tìm sản phẩm trong bảng OrderDetail với(product_id)
        #TODO: Nếu sản phẩm không tồn tại trả về lỗi! Tìm kiếm sản phẩm trong bảng OrderDetail(lọc qua order_id)
        return false if order == nil
        #TODO: Nếu hàng trả lớn hơn hàng bán trả về lỗi! (số lượng bán - số lượng đã trả) < số lượng trả
        return false if (order.quality - order.return_quality) < return_quality
      end
    end

    def data_validation_update_return (product)
      return_detail=Product.find_by(id:product.product_id)
      false if return_detail != nil || product.return_quality < product.quality || return_detail.available_quality < product.quality
    end

end
