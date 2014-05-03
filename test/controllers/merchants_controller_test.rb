require 'test_helper'

class MerchantsControllerTest < ActionController::TestCase
  setup do
    @merchant = merchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant" do
    assert_difference('Merchant.count') do
      post :create, merchant: { headquater_id: @merchant.headquater_id, name: @merchant.name, owner_id: @merchant.owner_id }
    end

    assert_redirected_to merchant_path(assigns(:merchant))
  end

  test "should show merchant" do
    get :show, id: @merchant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant
    assert_response :success
  end

  test "should update merchant" do
    patch :update, id: @merchant, merchant: { headquater_id: @merchant.headquater_id, name: @merchant.name, owner_id: @merchant.owner_id }
    assert_redirected_to merchant_path(assigns(:merchant))
  end

  test "should destroy merchant" do
    assert_difference('Merchant.count', -1) do
      delete :destroy, id: @merchant
    end

    assert_redirected_to merchants_path
  end
end
