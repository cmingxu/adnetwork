class AnalyticDatum < ActiveRecord::Base
  attr_accessible :ad_vender, :product, :country_code, :platform, :report_date, :impression, :click, :install, :cost, :artwork

  belongs_to :artwork
  belongs_to :product
  belongs_to :ad_vender
  belongs_to :vender_feedback
  belongs_to :analytic_sum

  #scope :between, lambda { |start, end| where(:report_date => start..end)}

end
