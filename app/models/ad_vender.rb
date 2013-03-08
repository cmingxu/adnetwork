class AdVender < ActiveRecord::Base
  attr_accessible :name, :artwork_size_list
  acts_as_taggable_on :artwork_sizes

  has_many :artwork_distribution
  has_many :artworks, :through => :artwork_distribution
end

