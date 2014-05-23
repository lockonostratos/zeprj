require 'test_helper'

class MerchantAccountRolesControllerTest < ActionController::TestCase
  setup do
    @merchant_account_role = merchant_account_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchant_account_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_account_role" do
    assert_difference('MerchantAccountRole.count') do
      post :create, merchant_account_role: { merchant_account_id: @merchant_account_role.merchant_account_id, permission_text: @merchant_account_role.permission_text, role_id: @merchant_account_role.role_id }
    end

    assert_redirected_to merchant_account_role_path(assigns(:merchant_account_role))
  end

  test "should show merchant_account_role" do
    get :show, id: @merchant_account_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_account_role
    assert_response :success
  end

  test "should update merchant_account_role" do
    patch :update, id: @merchant_account_role, merchant_account_role: { merchant_account_id: @merchant_account_role.merchant_account_id, permission_text: @merchant_account_role.permission_text, role_id: @merchant_account_role.role_id }
    assert_redirected_to merchant_account_role_path(assigns(:merchant_account_role))
  end

  test "should destroy merchant_account_role" do
    assert_difference('MerchantAccountRole.count', -1) do
      delete :destroy, id: @merchant_account_role
    end

    assert_redirected_to merchant_account_roles_path
  end
end
