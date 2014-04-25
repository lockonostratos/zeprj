class Customer < ActiveRecord::Base
  has_many :orders
  has_many :mackay_profiles
  has_many :mackay_personals, :through => :mackay_profiles
  has_many :mackay_educations, :through => :mackay_profiles
  has_many :mackay_families, :through => :mackay_profiles
  has_many :mackay_careers, :through => :mackay_profiles
  has_many :mackay_hobbies, :through => :mackay_profiles
  has_many :mackay_life_styles, :through => :mackay_profiles
  has_many :mackay_and_companies, :through => :mackay_profiles

  belongs_to :merchant
  belongs_to :merchant_account
  belongs_to :area
end