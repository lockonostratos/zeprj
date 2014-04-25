class AgencyAccount < ActiveRecord::Base
  belongs_to :account
  belongs_to :agency
end