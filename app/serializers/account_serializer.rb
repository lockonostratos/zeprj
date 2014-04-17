class AccountSerializer < ActiveModel::Serializer
  attributes :id, :display_name, :email
end
