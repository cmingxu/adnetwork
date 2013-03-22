require 'zip/zip'

class AdVender < ActiveRecord::Base
  attr_accessible :name, :artwork_size_list
  acts_as_taggable_on :artwork_sizes

  has_many :artwork_distributions, :dependent => :destroy
  has_many :artworks, :through => :artwork_distributions
  has_many :analytic_data

  validates_uniqueness_of :name

  def artworks_package(platform, product_id)
    latest_ad    = ArtworkDistribution.artworks_for(self.id, platform, product_id).first
    return false unless latest_ad
    latest_ads   = ArtworkDistribution.artworks_for(self.id, platform, product_id).with_version(latest_ad.version)
    package_name = File.join Rails.root, "/tmp/#{name}_#{platform}_#{Product.find(product_id).name}_#{Time.now.strftime("%Y%m%d")}.zip"

    File.delete(package_name) if File.exist?(package_name)

    Zip::ZipFile.open(package_name, Zip::ZipFile::CREATE) do |zipfile|
      latest_ads.each do |ad|
        path = ad.artwork.artwork.current_path
        zipfile.add("#{ad.artwork.id}_#{File.basename(path)}", path)
      end
    end
    package_name
  end

end
