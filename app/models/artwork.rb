class Artwork < ActiveRecord::Base
  belongs_to :product
  attr_accessible :size, :product_id, :artwork, :artwork_distribution_id, :ad_venders, :ad_vender_ids

  has_many :artwork_distribution
  has_many :ad_venders, :through => :artwork_distribution

  mount_uploader :artwork, ArtworkUploader
end
