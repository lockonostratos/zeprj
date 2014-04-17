require 'test_helper'

class MerSkullsControllerTest < ActionController::TestCase
  setup do
    @mer_skull = mer_skulls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mer_skulls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mer_skull" do
    assert_difference('MerSkull.count') do
      post :create, mer_skull: { description: @mer_skull.description, skull_code: @mer_skull.skull_code }
    end

    assert_redirected_to mer_skull_path(assigns(:mer_skull))
  end

  test "should show mer_skull" do
    get :show, id: @mer_skull
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mer_skull
    assert_response :success
  end

  test "should update mer_skull" do
    patch :update, id: @mer_skull, mer_skull: { description: @mer_skull.description, skull_code: @mer_skull.skull_code }
    assert_redirected_to mer_skull_path(assigns(:mer_skull))
  end

  test "should destroy mer_skull" do
    assert_difference('MerSkull.count', -1) do
      delete :destroy, id: @mer_skull
    end

    assert_redirected_to mer_skulls_path
  end
end
