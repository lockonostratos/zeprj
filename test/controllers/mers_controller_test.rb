require 'test_helper'

class MersControllerTest < ActionController::TestCase
  setup do
    @mer = mers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mer" do
    assert_difference('Mer.count') do
      post :create, mer: { head: @mer.head, name: @mer.name }
    end

    assert_redirected_to mer_path(assigns(:mer))
  end

  test "should show mer" do
    get :show, id: @mer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mer
    assert_response :success
  end

  test "should update mer" do
    patch :update, id: @mer, mer: { head: @mer.head, name: @mer.name }
    assert_redirected_to mer_path(assigns(:mer))
  end

  test "should destroy mer" do
    assert_difference('Mer.count', -1) do
      delete :destroy, id: @mer
    end

    assert_redirected_to mers_path
  end
end
