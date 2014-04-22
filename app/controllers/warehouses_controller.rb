class WarehousesController < ApplicationController
  def home
    @products = Product.all
    respond_to do |format|
      format.json {render json: @products }
    end
  end
end