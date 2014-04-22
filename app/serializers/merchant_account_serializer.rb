class MerchantAccountSerializer < ActiveModel::Serializer
  attributes :id, :merchant_id, :branch_id, :current_warehouse_id
end
