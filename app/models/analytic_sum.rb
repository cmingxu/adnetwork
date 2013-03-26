class AnalyticSum < ActiveRecord::Base
  attr_accessible :click, :cost, :country_code,
    :cpc, :cpi, :ctr, :cvr, :impression,
    :install, :platform

  belongs_to :product
  belongs_to :ad_vender
  belongs_to :artwork
  has_many :analytic_data

  scope :in_range_of,    lambda { |attr, left, right| where(attr => left..right)}
  scope :matched_values, lambda { |attr, values| where(attr => values)}
  scope :less_than,      lambda { |attr, value| where("#{attr} < ?", value)}
  scope :greater_than,   lambda { |attr, value| where("#{attr} > ?", value)}

  default_scope includes([:product, :artwork, :ad_vender])

  after_initialize :default_values

  private
  def default_values
    self.impression ||= 0
    self.click      ||= 0
    self.install    ||= 0
    self.cost       ||= 0.0
  end

  def self.query(query_params, order_params)
    scoped_query = self.scoped

    query_params.each do |k, v|
      v.gsub! /\s/, ''
      case v
      when /^(\d+)-(\d+)$/
        scoped_query = scoped_query.in_range_of(k, $1, $2)
      when /^<(\w+)$/
        scoped_query = scoped_query.less_than(k, $1)
      when /^>(\w+)$/
        scoped_query = scoped_query.greater_than(k, $1)
      when /^\w+(\|\w+)*$/
        scoped_query = scoped_query.matched_values(k, v.split('|'))
      end
    end

    scoped_query.order("#{order_params[:attr]} #{order_params[:direction]}")
  end
end
