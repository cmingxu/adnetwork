class Product < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  has_many :analytic_data
  has_many :analytic_sums
end
