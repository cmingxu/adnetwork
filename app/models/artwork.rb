class Artwork < ActiveRecord::Base
  belongs_to :product
  attr_accessible :size, :product_id, :artwork, :artwork_distribution_id, :ad_venders, :ad_vender_ids, :platform

  has_many :artwork_distribution, :dependent => :destroy
  has_many :ad_venders, :through => :artwork_distribution

  mount_uploader :artwork, ArtworkUploader

  validate :validate_minimum_image_size

  def validate_minimum_image_size
    return unless artwork?
    image = MiniMagick::Image.open(artwork.current_path)
    width, height = size.split("x")
    unless image[:width] == width.to_i && image[:height] == height.to_i
      errors.add :image, "should be #{size}px minimum"
    end
  end
end
