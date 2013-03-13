class ArtworkDistribution < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :ad_vender
  before_save :default_values
  attr_accessible :version

  scope :artworks_for, lambda { |ad_vender_id, platform, product_id|
    joins(:ad_vender, :artwork)
    .where({
      'ad_venders.id'       => ad_vender_id,
      'artworks.platform'   => platform,
      'artworks.product_id' => product_id
    })
    .order('version desc')
  }
  scope :with_version, lambda { |version| where(:version => version) }


  def default_values
    self.version ||= Time.now.strftime '%Y%m%d'
  end
end
