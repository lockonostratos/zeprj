class ProductSummary < ActiveRecord::Base
  belongs_to :skull
  belongs_to :warehouse
  belongs_to :merchant_account
  has_many :temp_products

  after_create :create_temp_product

  #Search-------------------------------->
  searchable do
    integer :warehouse_id
  end

  private
  # def self.search(search)
  #   where('name LIKE ?' , "%#{search}%")
  # end
end