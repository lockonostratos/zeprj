class ProductSummary < ActiveRecord::Base
  belongs_to :skull
  belongs_to :warehouse
  belongs_to :merchant_account

  after_create :create_temp_product

  private

  def create_temp_product
    TempProduct.create! ({product_code:self.product_code, skull_id:self.skull_id, warehouse_id:self.warehouse_id, merchant_account_id:self.merchant_account_id, name:self.name, import_price:self.price})
  end
end