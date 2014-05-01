class MerchantAccountSerializer < ActiveModel::Serializer
  attributes :id, :current_warehouse_id, :branch_id, :merchant_id
end
