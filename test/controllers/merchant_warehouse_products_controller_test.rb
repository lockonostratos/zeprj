require 'test_helper'

class MerchantWarehouseProductsControllerTest < ActionController::TestCase
  setup do
    @product = merchant_warehouse_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant_warehouse_product" do
    assert_difference('MerchantWarehouseProduct.count') do
      post :create, product: { merchant_warehouse: @product.merchant_warehouse, name: @product.name, price: @product.price, product_code: @product.product_code, quality_all: @product.quality_all, skull_code: @product.skull_code }
    end

    assert_redirected_to merchant_warehouse_product_path(assigns(:product))
  end

  test "should show merchant_warehouse_product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update merchant_warehouse_product" do
    patch :update, id: @product, product: { merchant_warehouse: @product.merchant_warehouse, name: @product.name, price: @product.price, product_code: @product.product_code, quality_all: @product.quality_all, skull_code: @product.skull_code }
    assert_redirected_to merchant_warehouse_product_path(assigns(:product))
  end

  test "should destroy merchant_warehouse_product" do
    assert_difference('MerchantWarehouseProduct.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to merchant_warehouse_products_path
  end
end
