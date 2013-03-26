class AnalyticDatum < ActiveRecord::Base
  attr_accessible :ad_vender, :product, :country_code,
    :platform, :report_date, :impression,
    :click, :install, :cost, :artwork, :analytic_sum

  belongs_to :artwork
  belongs_to :product
  belongs_to :ad_vender
  belongs_to :vender_feedback
  belongs_to :analytic_sum

  #scope :between, lambda { |start, end| where(:report_date => start..end)}
  after_initialize :default_values
  after_create     :incr_sums
  after_destroy    :decr_sums

  private
  def default_values
    self.impression ||= 0
    self.click      ||= 0
    self.install    ||= 0
    self.cost       ||= 0.0
  end

  def incr_sums
    analytic_sum = AnalyticSum.where(
        :product_id         => product.id,
        :artwork_id         => artwork.id,
        :ad_vender_id       => ad_vender.id,
        :platform           => platform,
        :country_code       => country_code
    ).first_or_initialize

    analytic_sum.impression += impression
    analytic_sum.click      += click
    analytic_sum.install    += install
    analytic_sum.cost       += cost
    analytic_sum.save

    self.update_attributes!(:analytic_sum => analytic_sum)
  end

  def decr_sums
    analytic_sum.impression -= impression
    analytic_sum.click      -= click
    analytic_sum.install    -= install
    analytic_sum.cost       -= cost
    analytic_sum.save
  end

end
