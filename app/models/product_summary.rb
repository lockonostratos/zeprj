class ProductSummary < ActiveRecord::Base
  belongs_to :skull
  belongs_to :warehouse
end