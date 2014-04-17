require 'test_helper'

class MerWarehousesControllerTest < ActionController::TestCase
  setup do
    @mer_warehouse = mer_warehouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mer_warehouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mer_warehouse" do
    assert_difference('MerWarehouse.count') do
      post :create, mer_warehouse: { branche_id: @mer_warehouse.branche_id, location: @mer_warehouse.location, name: @mer_warehouse.name }
    end

    assert_redirected_to mer_warehouse_path(assigns(:mer_warehouse))
  end

  test "should show mer_warehouse" do
    get :show, id: @mer_warehouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mer_warehouse
    assert_response :success
  end

  test "should update mer_warehouse" do
    patch :update, id: @mer_warehouse, mer_warehouse: { branche_id: @mer_warehouse.branche_id, location: @mer_warehouse.location, name: @mer_warehouse.name }
    assert_redirected_to mer_warehouse_path(assigns(:mer_warehouse))
  end

  test "should destroy mer_warehouse" do
    assert_difference('MerWarehouse.count', -1) do
      delete :destroy, id: @mer_warehouse
    end

    assert_redirected_to mer_warehouses_path
  end
end
