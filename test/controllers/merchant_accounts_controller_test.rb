require 'test_helper'

class MerchantAccountsControllerTest < ActionController::TestCase
  setup do
    @merchant_account = merchant_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchant_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_account" do
    assert_difference('MerchantAccount.count') do
      post :create, merchant_account: { account_id: @merchant_account.account_id, branch_id: @merchant_account.branch_id, current_warehouse_id: @merchant_account.current_warehouse_id, merchant_id: @merchant_account.merchant_id, role_id: @merchant_account.role_id }
    end

    assert_redirected_to merchant_account_path(assigns(:merchant_account))
  end

  test "should show merchant_account" do
    get :show, id: @merchant_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant_account
    assert_response :success
  end

  test "should update merchant_account" do
    patch :update, id: @merchant_account, merchant_account: { account_id: @merchant_account.account_id, branch_id: @merchant_account.branch_id, current_warehouse_id: @merchant_account.current_warehouse_id, merchant_id: @merchant_account.merchant_id, role_id: @merchant_account.role_id }
    assert_redirected_to merchant_account_path(assigns(:merchant_account))
  end

  test "should destroy merchant_account" do
    assert_difference('MerchantAccount.count', -1) do
      delete :destroy, id: @merchant_account
    end

    assert_redirected_to merchant_accounts_path
  end
end
