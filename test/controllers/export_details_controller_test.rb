require 'test_helper'

class ExportDetailsControllerTest < ActionController::TestCase
  setup do
    @export_detail = export_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:export_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create export_detail" do
    assert_difference('ExportDetail.count') do
      post :create, export_detail: { export_id: @export_detail.export_id, product_id: @export_detail.product_id, quality: @export_detail.quality }
    end

    assert_redirected_to export_detail_path(assigns(:export_detail))
  end

  test "should show export_detail" do
    get :show, id: @export_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @export_detail
    assert_response :success
  end

  test "should update export_detail" do
    patch :update, id: @export_detail, export_detail: { export_id: @export_detail.export_id, product_id: @export_detail.product_id, quality: @export_detail.quality }
    assert_redirected_to export_detail_path(assigns(:export_detail))
  end

  test "should destroy export_detail" do
    assert_difference('ExportDetail.count', -1) do
      delete :destroy, id: @export_detail
    end

    assert_redirected_to export_details_path
  end
end
