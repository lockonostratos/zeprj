require 'test_helper'

class GeraAccountsControllerTest < ActionController::TestCase
  setup do
    @account = gera_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { display_name: @account.display_name, email: @account.email, login_name: @account.login_name, password: @account.password, phone: @account.phone, status: @account.status }
    end

    assert_redirected_to gera_account_path(assigns(:account))
  end

  test "should show account" do
    get :new, id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "should update account" do
    patch :update, id: @account, account: { display_name: @account.display_name, email: @account.email, login_name: @account.login_name, password: @account.password, phone: @account.phone, status: @account.status }
    assert_redirected_to gera_account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to gera_accounts_path
  end
end
