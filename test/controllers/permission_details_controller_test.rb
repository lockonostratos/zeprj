require 'test_helper'

class PermissionDetailsControllerTest < ActionController::TestCase
  setup do
    @permission_detail = permission_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permission_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create permission_detail" do
    assert_difference('PermissionDetail.count') do
      post :create, permission_detail: { name: @permission_detail.name, permission_id: @permission_detail.permission_id }
    end

    assert_redirected_to permission_detail_path(assigns(:permission_detail))
  end

  test "should show permission_detail" do
    get :show, id: @permission_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @permission_detail
    assert_response :success
  end

  test "should update permission_detail" do
    patch :update, id: @permission_detail, permission_detail: { name: @permission_detail.name, permission_id: @permission_detail.permission_id }
    assert_redirected_to permission_detail_path(assigns(:permission_detail))
  end

  test "should destroy permission_detail" do
    assert_difference('PermissionDetail.count', -1) do
      delete :destroy, id: @permission_detail
    end

    assert_redirected_to permission_details_path
  end
end
