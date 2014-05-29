class MerchantApplicationController < ApplicationController
  def current_merchant_account
    @current_merchant_account ||= MerchantAccount.find(@current_account.id) if @current_account
  end

  helper_method :current_merchant_account
  helper_method :get_all_customers
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
    #@warehouses.where(branch_id:2)
    #Lọc Warehouse theo permission
    #@warehouses = @warehouses.where.not(id:1)
    #params =  {id:3, branch_id:2, name:'1'}
    #@warehouses = @warehouses - params.to_a

    branch = Branch.where(merchant_id:current_merchant_account.merchant_id)
    @warehouses = Warehouse.where(branch_id:(branch.pluck(:id)))
    warehoues=(@warehouses.pluck(:id))
    warehoues.each do |ex|
      return true if (ex.to_param == warehouse_id )
    end
  end

  def get_all_customers(area_id)
    @customers = Customer.where(area_id:area_id)
    @customers
  end

  def all_warehouse_on_merchant(merchant_id)
    warehouses = Warehouse.where(merchant_id:merchant_id)
    return warehouses
  end


  #Report-------------------------------------------------------------------------------->

  #Report bán hàng theo Ngày , Merchant, Branch , Warehouse (chưa lọc dữ liệu, chỉ nhận dữ liệu chính xác)
  #Trả về tổng quát trong bản Order theo(loai phieu, kieu phieu, xac nhan, ngay bat dau, ngay ket thuc, merchant, branch, warehouse, nhan vien)
  def report_all_time_and_warehouse_account(report, type_report, success, time_begin, time_end, merchant, branch, warehouse, merchant_account)
    #Xu ly Order, Return, Delivery
    if report == 'order' || report == 'return' || report == 'delivery'
      #lấy tất cả cua Merchant
      if time_begin != nil and time_end !=nil and merchant !=nil and merchant_account == nil and (type_report == 0 || type_report == 1)
       orders = Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, warehouse_id: all_warehouse_on_merchant(merchant))
      elsif time_begin != nil and time_end !=nil and merchant !=nil and merchant_account != nil and (type_report == 0 || type_report == 1)
       orders = Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, warehouse_id:all_warehouse_on_merchant(merchant), merchant_account_id:merchant_account)
      end

      #lấy theo Branch
      if time_begin != nil and time_end !=nil and merchant ==nil and branch !=nil and merchant_account == nil and (type_report == 0 || type_report == 1)
        orders = Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, branch_id: branch)
      elsif time_begin != nil and time_end !=nil and merchant ==nil and branch !=nil and merchant_account != nil and (type_report == 0 || type_report == 1)
        orders = Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, branch_id: branch, merchant_account_id:merchant_account)
      end

      #lấy theo Branch và Warehouse
      if time_begin != nil and time_end !=nil and merchant ==nil and branch !=nil and warehouse !=nil and merchant_account == nil and (type_report == 0 || type_report == 1)
        orders = Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, branch_id: branch)
        orders += Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, warehouse_id:warehouse)
      elsif time_begin != nil and time_end !=nil and merchant ==nil and branch !=nil and warehouse !=nil and merchant_account != nil
         orders = Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, branch_id: branch, merchant_account_id:merchant_account)
         orders += Order.where(:created_at => time_begin.beginning_of_day..time_end.end_of_day, warehouse_id:warehouse, merchant_account_id:merchant_account)
      end

      #Tra ve Order
      if orders == []
        return nil
      elsif report == 'order' and type_report == 0 and success == nil
        return orders.uniq()
      elsif report == 'order' and type_report == 0 and success == 0
        return orders.where(delivery:0).uniq()
      elsif report == 'order' and type_report == 0 and success == 1
        return orders.where(delivery:1).uniq()
      elsif report == 'order' and type_report == 0 and success == nil
        return OrderDetail.where(order_id: orders.uniq())
      elsif report == 'order' and type_report == 1 and success == 0
        return OrderDetail.where(order_id: orders.where(delivery:0).uniq())
      elsif report == 'order' and type_report == 1 and success == 1
        return OrderDetail.where(order_id: orders.where(delivery:1).uniq())
      end

      #Tra Ve Return
      if orders == []
        return nil
      elsif report == 'return' and type_report == 0 and success == nil
        returns = Return.where(order_id:orders.pluck(:id))
        return  returns.uniq()
      elsif report == 'return' and type_report == 0 and success == 0
        returns = Return.where(order_id:orders.where(deliveries:0).pluck(:id))
        return  returns.uniq()
      elsif report == 'return' and type_report == 0 and success == 1
        returns = Return.where(order_id:orders.where(deliveries:1).pluck(:id))
        return  returns.uniq()
      elsif report == 'return' and type_report == 1 and success == nil
        returns = Return.where(order_id:orders.pluck(:id))
        return ReturnDetail.where(return_id:returns.pluck(:id)).uniq()
      elsif report == 'return' and type_report == 1 and success == 0
        returns = Return.where(order_id:orders.where(deliveries:0).pluck(:id))
        return ReturnDetail.where(return_id:returns.pluck(:id)).uniq()
      elsif report == 'return' and type_report == 1 and success == 1
        returns = Return.where(order_id:orders.where(deliveries:1).pluck(:id))
        return ReturnDetail.where(return_id:returns.pluck(:id)).uniq()
      end

      #Tra Ve Delivery
      if orders == []
        return nil
      elsif report == 'delivery' and (type_report == 0 || type_report == 1) and success == nul
        delivery = Delivery.where(order_id:orders.pluck(:id))
        return  delivery.uniq()
      elsif report == 'delivery' and (type_report == 0 || type_report == 1) and success == 0
        delivery = Delivery.where(order_id:orders.pluck(:id), success:0)
        return  delivery.uniq()
      elsif report == 'delivery' and (type_report == 0 || type_report == 1) and success == 1
        delivery = Delivery.where(order_id:orders.pluck(:id), success:1)
        return  delivery.uniq()
      end

    #Xu ly Import, Export, Inventory
    elsif report =='import' || report == 'export' || report == 'inventory'

    end

  end





end
