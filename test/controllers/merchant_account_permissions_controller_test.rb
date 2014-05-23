require 'test_helper'

class MerchantAccountPermissionsControllerTest < ActionController::TestCase
  setup do
    @merchant_account_permission = merchant_account_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchant_account_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_account_permission" do
    assert_difference('MerchantAccountPermission.count') do
      post :create, merchant_account_permission: { active: @merchant_account_permission.active, merchant_account_id: @merchant_account_permission.merchant_account_id, permission_id: @merchant_account_permission.permission_id }
    end

    assert_redirected_to merchant_account_permission_path(assigns(:merchant_account_permission))
  end

  test "should show merchant_account_permission" do
    get :show, id: @merchant_account_permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_account_permission
    assert_response :success
  end

  test "should update merchant_account_permission" do
    patch :update, id: @merchant_account_permission, merchant_account_permission: { active: @merchant_account_permission.active, merchant_account_id: @merchant_account_permission.merchant_account_id, permission_id: @merchant_account_permission.permission_id }
    assert_redirected_to merchant_account_permission_path(assigns(:merchant_account_permission))
  end

  test "should destroy merchant_account_permission" do
    assert_difference('MerchantAccountPermission.count', -1) do
      delete :destroy, id: @merchant_account_permission
    end

    assert_redirected_to merchant_account_permissions_path
  end
end
