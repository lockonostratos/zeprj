class WarehousesController < ApplicationController
  def home
    @product_lists = Product.all
    respond_to do |format|
      format.json {render json: @product_lists }
    end
  end
end