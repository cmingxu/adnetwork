class Artwork < ActiveRecord::Base
  belongs_to :product
  attr_accessible :size

  has_many :artwork_distribution
  has_many :ad_venders, :through => :artwork_distribution

  mount_uploader :artwork, ArtworkUploader
end
