require 'test_helper'

class MerchantAccountPermissionDetailsControllerTest < ActionController::TestCase
  setup do
    @merchant_account_permission_detail = merchant_account_permission_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchant_account_permission_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_account_permission_detail" do
    assert_difference('MerchantAccountPermissionDetail.count') do
      post :create, merchant_account_permission_detail: { merchant_account_id: @merchant_account_permission_detail.merchant_account_id, permission_id: @merchant_account_permission_detail.permission_id, permission_text: @merchant_account_permission_detail.permission_text }
    end

    assert_redirected_to merchant_account_permission_detail_path(assigns(:merchant_account_permission_detail))
  end

  test "should show merchant_account_permission_detail" do
    get :show, id: @merchant_account_permission_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_account_permission_detail
    assert_response :success
  end

  test "should update merchant_account_permission_detail" do
    patch :update, id: @merchant_account_permission_detail, merchant_account_permission_detail: { merchant_account_id: @merchant_account_permission_detail.merchant_account_id, permission_id: @merchant_account_permission_detail.permission_id, permission_text: @merchant_account_permission_detail.permission_text }
    assert_redirected_to merchant_account_permission_detail_path(assigns(:merchant_account_permission_detail))
  end

  test "should destroy merchant_account_permission_detail" do
    assert_difference('MerchantAccountPermissionDetail.count', -1) do
      delete :destroy, id: @merchant_account_permission_detail
    end

    assert_redirected_to merchant_account_permission_details_path
  end
end
