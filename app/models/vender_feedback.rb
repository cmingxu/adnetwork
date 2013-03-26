require 'chronic'

class VenderFeedback < ActiveRecord::Base
  attr_accessible :chart, :platform, :analytic_data, :product, :ad_vender

  belongs_to :product
  belongs_to :ad_vender

  has_many :analytic_data, :dependent => :destroy

  mount_uploader :chart, ChartUploader

  validates :chart, :presence => true
  validate :csv_format

  after_save :import_csv

  def csv_format
    parser = parser('gdn')
    return unless self.chart_changed?
    csv = Roo::Csv.new(chart.current_path)
    # check titles
    errors.add(:chart, "Expect Header: #{parser[:titles].join('|')}") and return if csv.first != parser[:titles]
    # check body, require all fields present
    csv.each_with_index do |row, i|
      next if i == 0
      all_fields_present = parser[:index].reduce(true) { |s, (k, v)| s &= row[v] }
      errors.add(:chart, "please check line #{i}") unless all_fields_present
      errors.add(:chart, "line #{i+1}: product doesn't exist") unless Product.where(:name => row[parser[:index][:product_name]]).exists?
      errors.add(:chart, "line #{i+1}: artwork doesn't exist") unless Artwork.where(:id => row[parser[:index][:artwork_id]]).exists?
      errors.add(:chart, "line #{i+1}: ad_vender doesn't exist") unless AdVender.where(:name => row[parser[:index][:ad_vender_name]]).exists?
    end
  end

  def import_csv
    return unless self.chart_changed?
    parser = parser('gdn')
    csv = Roo::Csv.new(chart.current_path)
    csv.each_with_index do |row, i|
      next if i == 0
      product      = Product.where(:name => row[parser[:index][:product_name]]).first
      artwork      = Artwork.where(:id => row[parser[:index][:artwork_id]]).first
      ad_vender    = AdVender.where(:name => row[parser[:index][:ad_vender_name]]).first
      platform     = row[parser[:index][:platform]].downcase
      report_date  = Chronic.parse row[parser[:index][:report_date]]
      country_code = row[parser[:index][:country_code]].upcase

      ad = AnalyticDatum.where(
        :product_id         => product.id,
        :artwork_id         => artwork.id,
        :ad_vender_id       => ad_vender.id,
        :vender_feedback_id => self.id,
        :platform           => platform,
        :report_date        => report_date,
        :country_code       => country_code
      ).first_or_initialize

      ad.impression += row[parser[:index][:impression]].gsub(/,/, '').to_i
      ad.click      += row[parser[:index][:click]].gsub(/,/, '').to_i
      ad.install    += row[parser[:index][:install]].gsub(/,/, '').to_i
      ad.cost       += row[parser[:index][:cost]].gsub(/[,$]/, '').to_f
      ad.save
    end
  end

  def parser(vender)
    YAML.load_file("#{Rails.root}/config/csv_parser.yml")[vender].with_indifferent_access
  end
end
