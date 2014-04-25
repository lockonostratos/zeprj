require 'test_helper'

class ProductSummariesControllerTest < ActionController::TestCase
  setup do
    @product_summary = product_summaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_summaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_summary" do
    assert_difference('ProductSummary.count') do
      post :create, product_summary: { name: @product_summary.name, price: @product_summary.price, product_code: @product_summary.product_code, qualtiy: @product_summary.qualtiy, skull_id: @product_summary.skull_id, warehouse_id: @product_summary.warehouse_id }
    end

    assert_redirected_to product_summary_path(assigns(:product_summary))
  end

  test "should show product_summary" do
    get :show, id: @product_summary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_summary
    assert_response :success
  end

  test "should update product_summary" do
    patch :update, id: @product_summary, product_summary: { name: @product_summary.name, price: @product_summary.price, product_code: @product_summary.product_code, qualtiy: @product_summary.qualtiy, skull_id: @product_summary.skull_id, warehouse_id: @product_summary.warehouse_id }
    assert_redirected_to product_summary_path(assigns(:product_summary))
  end

  test "should destroy product_summary" do
    assert_difference('ProductSummary.count', -1) do
      delete :destroy, id: @product_summary
    end

    assert_redirected_to product_summaries_path
  end
end
