require 'test_helper'

class TempInventoryDetailsControllerTest < ActionController::TestCase
  setup do
    @temp_inventory_detail = temp_inventory_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temp_inventory_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temp_inventory_detail" do
    assert_difference('TempInventoryDetail.count') do
      post :create, temp_inventory_detail: { inventory: @temp_inventory_detail.inventory, original_quality: @temp_inventory_detail.original_quality, product_id: @temp_inventory_detail.product_id, quality: @temp_inventory_detail.quality, real_quality: @temp_inventory_detail.real_quality }
    end

    assert_redirected_to temp_inventory_detail_path(assigns(:temp_inventory_detail))
  end

  test "should show temp_inventory_detail" do
    get :show, id: @temp_inventory_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @temp_inventory_detail
    assert_response :success
  end

  test "should update temp_inventory_detail" do
    patch :update, id: @temp_inventory_detail, temp_inventory_detail: { inventory: @temp_inventory_detail.inventory, original_quality: @temp_inventory_detail.original_quality, product_id: @temp_inventory_detail.product_id, quality: @temp_inventory_detail.quality, real_quality: @temp_inventory_detail.real_quality }
    assert_redirected_to temp_inventory_detail_path(assigns(:temp_inventory_detail))
  end

  test "should destroy temp_inventory_detail" do
    assert_difference('TempInventoryDetail.count', -1) do
      delete :destroy, id: @temp_inventory_detail
    end

    assert_redirected_to temp_inventory_details_path
  end
end
