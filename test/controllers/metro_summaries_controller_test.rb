require 'test_helper'

class MetroSummariesControllerTest < ActionController::TestCase
  setup do
    @metro_summary = metro_summaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metro_summaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metro_summary" do
    assert_difference('MetroSummary.count') do
      post :create, metro_summary: { customer_count: @metro_summary.customer_count, product_count: @metro_summary.product_count, return_count: @metro_summary.return_count, return_count_day: @metro_summary.return_count_day, return_count_month: @metro_summary.return_count_month, revenue: @metro_summary.revenue, revenue_day: @metro_summary.revenue_day, revenue_month: @metro_summary.revenue_month, sale_count: @metro_summary.sale_count, sale_count_day: @metro_summary.sale_count_day, sale_count_month: @metro_summary.sale_count_month, staff_count: @metro_summary.staff_count, stock_count: @metro_summary.stock_count, warehouse_id: @metro_summary.warehouse_id }
    end

    assert_redirected_to metro_summary_path(assigns(:metro_summary))
  end

  test "should show metro_summary" do
    get :show, id: @metro_summary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metro_summary
    assert_response :success
  end

  test "should update metro_summary" do
    patch :update, id: @metro_summary, metro_summary: { customer_count: @metro_summary.customer_count, product_count: @metro_summary.product_count, return_count: @metro_summary.return_count, return_count_day: @metro_summary.return_count_day, return_count_month: @metro_summary.return_count_month, revenue: @metro_summary.revenue, revenue_day: @metro_summary.revenue_day, revenue_month: @metro_summary.revenue_month, sale_count: @metro_summary.sale_count, sale_count_day: @metro_summary.sale_count_day, sale_count_month: @metro_summary.sale_count_month, staff_count: @metro_summary.staff_count, stock_count: @metro_summary.stock_count, warehouse_id: @metro_summary.warehouse_id }
    assert_redirected_to metro_summary_path(assigns(:metro_summary))
  end

  test "should destroy metro_summary" do
    assert_difference('MetroSummary.count', -1) do
      delete :destroy, id: @metro_summary
    end

    assert_redirected_to metro_summaries_path
  end
end
