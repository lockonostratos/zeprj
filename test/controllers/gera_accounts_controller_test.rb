require 'test_helper'

class GeraAccountsControllerTest < ActionController::TestCase
  setup do
    @gera_account = gera_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gera_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gera_account" do
    assert_difference('GeraAccount.count') do
      post :create, gera_account: { display_name: @gera_account.display_name, email: @gera_account.email, login_name: @gera_account.login_name, password: @gera_account.password }
    end

    assert_redirected_to gera_account_path(assigns(:gera_account))
  end

  test "should show gera_account" do
    get :show, id: @gera_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gera_account
    assert_response :success
  end

  test "should update gera_account" do
    patch :update, id: @gera_account, gera_account: { display_name: @gera_account.display_name, email: @gera_account.email, login_name: @gera_account.login_name, password: @gera_account.password }
    assert_redirected_to gera_account_path(assigns(:gera_account))
  end

  test "should destroy gera_account" do
    assert_difference('GeraAccount.count', -1) do
      delete :destroy, id: @gera_account
    end

    assert_redirected_to gera_accounts_path
  end
end
