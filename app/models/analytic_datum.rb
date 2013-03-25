class AnalyticDatum < ActiveRecord::Base
  attr_accessible :ad_vender, :product, :country_code, :platform, :report_date, :impression, :click, :install, :cost, :artwork
  belongs_to :artwork
  belongs_to :product
  belongs_to :ad_vender
  belongs_to :vender_feedback

  scope :in_range_of,    lambda { |attr, left, right| where(attr => left..right)}
  scope :matched_values, lambda { |attr, values| where(attr => values)}
  scope :less_than,      lambda { |attr, value| where("#{attr} < ?", value)}
  scope :greater_than,   lambda { |attr, value| where("#{attr} > ?", value)}
  default_scope includes([:product, :artwork, :ad_vender])

  def self.query(query_params, order_params)
    scoped_query = self.scoped

    query_params.each do |k, v|
      v.gsub! /\s/, ''
      case v
      when /^(\d+)-(\d+)$/
        scoped_query = scoped_query.in_range_of(k, value($1, k), value($1, k))
      when /^<(\w+)$/
        uppper = $1
        scoped_query = scoped_query.less_than(k, value($1, k))
      when /^>(\w+)$/
        scoped_query = scoped_query.greater_than(k, value($1,k))
      when /^\w+(\|\w+)*$/
        scoped_query = scoped_query.matched_values(k, value(v.split('|'), k))
      end
    end

    scoped_query.order("#{order_params[:attr]} #{order_params[:direction]}")
  end

  def self.value(target, k)
    return target unless k == 'report_date'
    if target.kind_of?(Array)
      target.map { |t| Time.new(t[0..3], t[4..5], t[6..7]) }
    else
      Time.new(target[0..3], target[4..5], target[6..7])
    end
  end

  def self.import_vender_feedback(vender_feedback)
  end
end
