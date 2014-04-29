require 'test_helper'

class TempProductsControllerTest < ActionController::TestCase
  setup do
    @temp_product = temp_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:temp_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create temp_product" do
    assert_difference('TempProduct.count') do
      post :create, temp_product: { expire: @temp_product.expire, import_price: @temp_product.import_price, import_quality: @temp_product.import_quality, merchant_account_id: @temp_product.merchant_account_id, name: @temp_product.name, product_code: @temp_product.product_code, provider_id: @temp_product.provider_id, skull_id: @temp_product.skull_id, warehouse_id: @temp_product.warehouse_id }
    end

    assert_redirected_to temp_product_path(assigns(:temp_product))
  end

  test "should show temp_product" do
    get :show, id: @temp_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @temp_product
    assert_response :success
  end

  test "should update temp_product" do
    patch :update, id: @temp_product, temp_product: { expire: @temp_product.expire, import_price: @temp_product.import_price, import_quality: @temp_product.import_quality, merchant_account_id: @temp_product.merchant_account_id, name: @temp_product.name, product_code: @temp_product.product_code, provider_id: @temp_product.provider_id, skull_id: @temp_product.skull_id, warehouse_id: @temp_product.warehouse_id }
    assert_redirected_to temp_product_path(assigns(:temp_product))
  end

  test "should destroy temp_product" do
    assert_difference('TempProduct.count', -1) do
      delete :destroy, id: @temp_product
    end

    assert_redirected_to temp_products_path
  end
end
