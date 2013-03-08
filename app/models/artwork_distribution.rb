class ArtworkDistribution < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :ad_vender
end
