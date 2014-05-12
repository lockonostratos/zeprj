require 'test_helper'

class InventoryDetailsControllerTest < ActionController::TestCase
  setup do
    @inventory_detail = inventory_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_detail" do
    assert_difference('InventoryDetail.count') do
      post :create, inventory_detail: { inventory_id: @inventory_detail.inventory_id, lost_quality: @inventory_detail.lost_quality, original_quality: @inventory_detail.original_quality, product_id: @inventory_detail.product_id, real_quality: @inventory_detail.real_quality, resolve_description: @inventory_detail.resolve_description, resolved: @inventory_detail.resolved, sale_quality: @inventory_detail.sale_quality }
    end

    assert_redirected_to inventory_detail_path(assigns(:inventory_detail))
  end

  test "should show inventory_detail" do
    get :show, id: @inventory_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_detail
    assert_response :success
  end

  test "should update inventory_detail" do
    patch :update, id: @inventory_detail, inventory_detail: { inventory_id: @inventory_detail.inventory_id, lost_quality: @inventory_detail.lost_quality, original_quality: @inventory_detail.original_quality, product_id: @inventory_detail.product_id, real_quality: @inventory_detail.real_quality, resolve_description: @inventory_detail.resolve_description, resolved: @inventory_detail.resolved, sale_quality: @inventory_detail.sale_quality }
    assert_redirected_to inventory_detail_path(assigns(:inventory_detail))
  end

  test "should destroy inventory_detail" do
    assert_difference('InventoryDetail.count', -1) do
      delete :destroy, id: @inventory_detail
    end

    assert_redirected_to inventory_details_path
  end
end
