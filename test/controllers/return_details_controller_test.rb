require 'test_helper'

class ReturnDetailsControllerTest < ActionController::TestCase
  setup do
    @return_detail = return_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:return_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create return_detail" do
    assert_difference('ReturnDetail.count') do
      post :create, return_detail: { price: @return_detail.price, product_id: @return_detail.product_id, return_id: @return_detail.return_id, return_product_id: @return_detail.return_product_id, return_quality: @return_detail.return_quality, type_return: @return_detail.type_return }
    end

    assert_redirected_to return_detail_path(assigns(:return_detail))
  end

  test "should show return_detail" do
    get :show, id: @return_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @return_detail
    assert_response :success
  end

  test "should update return_detail" do
    patch :update, id: @return_detail, return_detail: { price: @return_detail.price, product_id: @return_detail.product_id, return_id: @return_detail.return_id, return_product_id: @return_detail.return_product_id, return_quality: @return_detail.return_quality, type_return: @return_detail.type_return }
    assert_redirected_to return_detail_path(assigns(:return_detail))
  end

  test "should destroy return_detail" do
    assert_difference('ReturnDetail.count', -1) do
      delete :destroy, id: @return_detail
    end

    assert_redirected_to return_details_path
  end
end
