class Merchant < ActiveRecord::Base
  has_one :account
end