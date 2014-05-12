class ReturnsController < ApplicationController
  before_action :set_return, only: [:show, :edit, :update, :destroy]

  # GET /returns
  # GET /returns.json
  def index
    @returns = Return.all
  end

  # GET /returns/1
  # GET /returns/1.json
  def show
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
    return_quality = 5 #số lượng trả hàng

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
      flash[:notice] = 'Loi sai so luong san pham'
      redirect_to :action => :new
    end

    #3 Tạo Phiếu Trả Hàng --------------------------------------------------------------------------------------------->
    @return.submited = false
    @return.save()
    #4 Tạo phiếu chi tiết trả hàng, cập nhật số lượng trả hàng trong bảng OrderDetail --------------------------------->
    # Tạo phiếu trả hàng chi tiết sản phẩm trả hàng
    #TODO xác nhận trả hàng, kiểm tra ID hàng đổi, số lượng phù hay ko
    old_products.each do |product|
      # if product.type_return == true
      #   ReturnDetail.create(
      #       :return_id=>@return.id,
      #       :return_product_id=>product.product_id,
      #       :return_quality=>return_quality,
      #       :type_return=>false, # Giá trị true hay false là nhận từ return_details
      #       :product_id=>nil,
      #       :quality=>nil,
      #       :price=>nil
      #   )
      # elsif data_validation_update_return (product) == true
      ##TODO cần xử lý các biến co chính xác
      #   ReturnDetail.create(
      #       :return_id=>@return.id,
      #       :return_product_id=>product.product_id,
      #       :return_quality=>return_quality,
      #       :type_return=>false, # Giá trị true hay false là nhận từ return_details
      #       :product_id=>nil,
      #       :quality=>nil,
      #       :price=>nil
      #   )
      # else
      #   flash[:notice] = 'Có lổi trong quá trình trả sản phẩm'
      #   redirect_to :action => :new
      # end
      #

      ReturnDetail.create(
          :return_id=>@return.id,
          :return_product_id=>product.product_id,
          :return_quality=>return_quality,
          :type_return=>false, # Giá trị true hay false là nhận từ return_details
          :product_id=>nil,
          :quality=>nil,
          :price=>nil
      )
      #TODO coi lại cập nhật này trong Phần Quản lý
      # Cập nhật số lượng trả hàng trong vào phếu OrderDetail
      order = old_order.find_by product_id:product.product_id
      order.return_quality += return_quality
      order.save()
    end



    # respond_to do |format|
    #   if @return.save
    #      format.html { redirect_to @return, notice: 'Return was successfully created.' }
    #      format.json { render action: 'show', status: :created, location: @return }
    #   else
    #      format.html { render action: 'new' }
    #      format.json { render json: @return.errors, status: :unprocessable_entity }
    #   end
    # end
  end



  # PATCH/PUT /returns/1
  # PATCH/PUT /returns/1.json
  def update
    #respond_to do |format|
    #  if @return.update(return_params)
    #    format.html { redirect_to @return, notice: 'Return was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: 'edit' }
    #    format.json { render json: @return.errors, status: :unprocessable_entity }
    #  end
    #end

    #Nhận thông tin
    # # @return = Return.new(params[:order])
    # # @return_details = params[:return_details]

    #TODO Cập nhật phiếu trả hàng từ quản lý
    #1 Kiểm tra thông tin nhận--------------------------------->
      update_return = Return.new(return_params)
      old_return_detail = ReturnDetail.find_by_return_id(return_id:update_return.id)#giả lập dữ liệu
    #2 Kiểm tra ID của phiếu trả hàng
      if old_return_detail == nil then end
    #3 Nếu chưa có xác nhận của Quản Lý (submited==false), báo lổi
      if update_return.submited == false
        flash[:notice] = 'Loi sai ID'
        redirect_to :action => :edit , :location => @return
      end

    #4 Xử lý

    #4 Kiểm tra
      # if @return.update(return_params)
      #       if(@return.submited==true)
      #         #load thông tin chi tiet tra hang và cap nhat lại
      #         ReturnDetail.where(:return_id => @return.id).each do |returns|
      #           #doi hang
      #           if returns.type_return==false
      #             #tim hang tra
      #             pro1= Product.find(returns.return_product_id)
      #             #tim hang doi
      #             pro2= Product.find(returns.product_id)
      #             #kiem tra so luong tien tra
      #             if (returns.return_product_id != returns.product_id) and
      #                 ((pro1.import_price * returns.return_product_id) >= (pro2.import_price * returns.return_quality))
      #               #cap nhat hang tra
      #               pro1.update(
      #                   :available_quality=>(pro1.available_quality + returns.return_quality),
      #                   :instock_quality=>(pro1.instock_quality + returns.return_quality)
      #               )
      #               # cập nhật ProductSummary
      #               @pro_sum1 = ProductSummary.where(:product_code => pro1.product_code, :skull_id => pro1.skull_id).first(1)
      #               @pro_sum1.update(:quality=>(@pro_sum1.quality + returns.quality))
      #
      #               #cap nhat hang doi
      #               pro2.update(
      #                   :available_quality=>(pro2.available_quality - returns.quality),
      #                   :instock_quality=>(pro2.instock_quality - returns.quality)
      #               )
      #               # cập nhật ProductSummary
      #               @pro_sum2 = ProductSummary.where(:product_code => pro2.product_code, :skull_id => pro2.skull_id).first(1)
      #               @pro_sum2.update(:quality=>(@pro_sum2.quality - returns.quality))
      #
      #               #cap nhat chi tiet tra hang
      #               returns.price = ((pro1.import_price * returns.return_product_id) - (pro2.import_price * returns.return_quality))
      #               ReturnDetail.update(returns)
      #             end
      #
      #             #tra tien
      #           else
      #             #tim hang tra
      #             pro1= Product.find(returns.return_product_id)
      #             #cap nhat hang tra
      #             pro1.update(
      #                 :available_quality => (pro1.available_quality + returns.return_quality),
      #                 :instock_quality => (pro1.instock_quality + returns.return_quality)
      #             )
      #       #cap nhat chi tiet tra hang
      #       returns.price = (pro1.import_price * returns.return_product_id)
      #       ReturnDetail.update(returns)
      #     end
      #   end
      # end
      # end

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
