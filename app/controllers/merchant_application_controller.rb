class MerchantApplicationController < ApplicationController
  def current_merchant_account
    @current_merchant_account ||= MerchantAccount.find(@current_account.id) if @current_account
  end

  helper_method :current_merchant_account
  helper_method :get_all_customers

  #
  def permission_merchant_account
    permission = Permission.all
    current_permission=[]
    perm_role = MerchantAccountRole.where(merchant_account_id:current_merchant_account.id)
    perm_role.each do |permission|
      current_permission=current_permission + permission.permission_text.split(',')
    end
    current_permission = current_permission.uniq()
    merchant_perm = MerchantAccountPermission.where(merchant_account_id: current_merchant_account.id)
    merchant_perm.each do |mer_perm|
      if mer_perm.active == true
        current_permission = current_permission + [permission.find(mer_perm.permission_id).permission_key]
      else
        current_permission = current_permission - [permission.find(mer_perm.permission_id).permission_key]
      end
    end
    return current_permission
  end

  #Kiểm tra warehouse_id có cùng merchant với account hay ko , có thì return true
  def check_warehouse_permission(warehouse_id)
    branch = Branch.where(merchant_id:current_merchant_account.merchant_id)
    @warehouses = Warehouse.where(branch_id:(branch.pluck(:id)))
    warehoues=(@warehouses.pluck(:id))
    warehoues.each do |ex|
      return true if (ex.to_param == warehouse_id )
    end
  end
  #Kiểm tra Warehouse mà người dùng hiện tại có quyền truy cập
  def eqwe

  end
  #Lấy tất cả customers của một area
  def get_all_customers(area_id)
    @customers = Customer.where(area_id:area_id)
    @customers
  end
  #Lấy tất cả warehouse của một merchant
  def all_warehouse_on_merchant(merchant_id)
    warehouses = Warehouse.where(merchant_id:merchant_id)
    return warehouses
  end
  #Lấy tất cả order của một merchant
  def all_order_on_merchant(merchant_id)
    orders = Order.where(warehouse_id: (all_warehouse_on_merchant merchant_id).returnspluck(:id))
    return orders
  end



  #Report-------------------------------------------------------------------------------------------------------------->

  #Report bán hàng theo Ngày , Merchant, Branch , Warehouse (chưa lọc dữ liệu, chỉ nhận dữ liệu chính xác)
  #Trả về tổng quát trong bản Order theo
  # (Loai phieu, kieu phieu, xac nhan, ngay bat dau, ngay ket thuc, merchant, branch, warehouse, nhan vien)
  # Loai Phieu(report): order, return, delivery, import, export, inventory
  # Kieu Phieu(type_report): 0(Chua Xac Nhan), 1(Xac Nhan)
  # Merchant: nil(lấy tất cả)
  #

   def report_all_time_and_warehouse_account(report, type_report, success, time_begin, time_end,
                                             merchant, branch, warehouse, merchant_account, customer)
      #Xu ly Order, Return, Delivery
      if (report == 'order' || report == 'return' || report == 'delivery') and
          (type_report == 0 || type_report == 1) and
          (success ==nil || success == 0 || success == 1)
         #lấy tất cả order của Merchant
         if merchant !=nil
         orders = retrun_order_by_warehouse_and_merchant_account_and_customer time_begin,
                                                                               time_end,
                                                                               all_warehouse_on_merchant(merchant),
                                                                               merchant_account,
                                                                               customer
         end
         #lấy order theo Branch
         if merchant ==nil and branch !=nil
         orders = retrun_order_by_branch_and_merchant_account_and_customer time_begin,
                                                                           time_end,
                                                                           branch,
                                                                           merchant_account,
                                                                           customer if merchant_account != nil
         end
         #lấy order theo Branch và Warehouse
         if merchant ==nil and branch !=nil and warehouse !=nil
         orders += retrun_order_by_warehouse_and_merchant_account_and_customer time_begin,
                                                                               time_end,
                                                                               warehouse,
                                                                               merchant_account,
                                                                               customer if merchant_account != nil
         end

        #Tra ve Order
        if report == 'order'
          returns_order_report orders, type_report, success
        end
        #Tra Ve Return
        if report == 'return'
          returns_return_report orders, type_report, success
        end
        #Tra Ve Delivery
        if report == 'delivery'
          returns_delivery_report orders, type_report, success
        end
      #Xu ly Import, Export, Inventory
      elsif (report =='import' || report == 'export' || report == 'inventory') and
          (type_report == 0 || type_report == 1) and
          (success ==nil || success == 0 || success == 1)


      end
  end


  private
  #-------------------------------------------------------------------------------------------------------------------->
  def retrun_order_by_warehouse_and_merchant_account_and_customer (time_begin, time_end, warehouse, merchant_account, customer)
    if time_begin != nil and time_end == nil
    else #time_begin == nil and time_end != nil
    end

    if merchant_account == nil
      if customer == nil
        return Order.where(
            :created_at => time_begin.beginning_of_day..time_end.end_of_day,
            :warehouse_id => warehouse)
      else
        return Order.where(
            :created_at => time_begin.beginning_of_day..time_end.end_of_day,
            :warehouse_id => warehouse,
            :customer_id => customer)
      end
    else
      if customer == nil
        return Order.where(
            :created_at => time_begin.beginning_of_day..time_end.end_of_day,
            :warehouse_id => warehouse,
            :merchant_account_id => merchant_account)
      else
        return Order.where(
            :created_at => time_begin.beginning_of_day..time_end.end_of_day,
            :warehouse_id => warehouse,
            :merchant_account_id => merchant_account,
            :customer_id => customer)
      end
    end
  end

  def retrun_order_by_branch_and_merchant_account_and_customer (time_begin, time_end, branch, merchant_account, customer)
    if merchant_account == nil
      if customer == nil
        return Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day,
                           :branch_id => branch)
      else
        return Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day,
                           :branch_id => branch,
                           :customer_id => customer)
      end
    else
      if customer == nil
        return Order.where(
            :created_at => time_begin.beginning_of_day..time_end.end_of_day,
            :branch_id => branch,
            :merchant_account_id => merchant_account)
      else
        return Order.where(
            :created_at => time_begin.beginning_of_day..time_end.end_of_day,
            :branch_id => branch,
            :merchant_account_id => merchant_account,
            :customer_id => customer)
      end
    end
  end

  #-------------------------------------------------------------------------------------------------------------------->
  def returns_order_report (orders, type_report, success)
    #Trả về nil nếu order trống
    if orders == []
      return nil
    #Trả về theo dạng Tổng Quát
    elsif type_report == 0
      return orders.uniq() if success == nil
      return orders.where(delivery:success).uniq() if (success == 0 || success == 1)
    #Trả về theo dạng Bảng Kê
    elsif type_report == 1
      return OrderDetail.where(order_id: orders.uniq()) if success == nil
      return OrderDetail.where(order_id: orders.where(delivery:success).uniq()) if (success == 0 || success == 1)
    end
  end
  def returns_return_report (orders, type_report, success)
    #Trả về nil nếu order trống
    if orders == []
      return nil
    #Trả về theo dạng Tổng Quát
    elsif type_report == 0
      return Return.where(order_id: orders.returnspluck(:id)).uniq() if success == nil
      return Return.where(order_id: orders.where(deliveries: success).returnspluck(:id)).uniq() if (success == 0 || success == 1)
    #Trả về theo dạng Bảng Kê
    elsif type_report == 1
      if success == nil
        returns = Return.where(order_id: orders.returnspluck(:id))
        return ReturnDetail.where(return_id: returns.returnspluck(:id)).uniq()
      end
      if (success == 0 || success == 1)
        returns = Return.where(order_id: orders.where(deliveries: success))
        return ReturnDetail.where(return_id: returns.returnspluck(:id)).uniq()
      end
    end
  end
  def returns_delivery_report (orders, type_report, success)
    if orders == []
      return nil
    elsif (type_report == 0 || type_report == 1)
      return Delivery.where(order_id:orders.returnspluck(:id)).uniq() if success == nil
      return Delivery.where(order_id:orders.returnspluck(:id), success:success).uniq() if (success == 0 || success == 1)
    end
  end
  #-------------------------------------------------------------------------------------------------------------------->
end
