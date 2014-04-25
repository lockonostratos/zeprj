require 'test_helper'

class SkullsControllerTest < ActionController::TestCase
  setup do
    @skull = skulls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skulls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skull" do
    assert_difference('Skull.count') do
      post :create, skull: { description: @skull.description, merchant_account_id: @skull.merchant_account_id, merchant_id: @skull.merchant_id, skull_code: @skull.skull_code }
    end

    assert_redirected_to skull_path(assigns(:skull))
  end

  test "should show skull" do
    get :show, id: @skull
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skull
    assert_response :success
  end

  test "should update skull" do
    patch :update, id: @skull, skull: { description: @skull.description, merchant_account_id: @skull.merchant_account_id, merchant_id: @skull.merchant_id, skull_code: @skull.skull_code }
    assert_redirected_to skull_path(assigns(:skull))
  end

  test "should destroy skull" do
    assert_difference('Skull.count', -1) do
      delete :destroy, id: @skull
    end

    assert_redirected_to skulls_path
  end
end
