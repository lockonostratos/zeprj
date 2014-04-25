require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { branch_id: @order.branch_id, contact_name: @order.contact_name, contact_phone: @order.contact_phone, creation_date: @order.creation_date, customer_id: @order.customer_id, delivery_address: @order.delivery_address, delivery_date: @order.delivery_date, deposit: @order.deposit, discount_cash: @order.discount_cash, final_price: @order.final_price, merchant_account_id: @order.merchant_account_id, payment_method: @order.payment_method, return_id: @order.return_id, status: @order.status, total_price: @order.total_price, warehouse_id: @order.warehouse_id }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { branch_id: @order.branch_id, contact_name: @order.contact_name, contact_phone: @order.contact_phone, creation_date: @order.creation_date, customer_id: @order.customer_id, delivery_address: @order.delivery_address, delivery_date: @order.delivery_date, deposit: @order.deposit, discount_cash: @order.discount_cash, final_price: @order.final_price, merchant_account_id: @order.merchant_account_id, payment_method: @order.payment_method, return_id: @order.return_id, status: @order.status, total_price: @order.total_price, warehouse_id: @order.warehouse_id }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
