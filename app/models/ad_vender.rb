require 'zip/zip'

class AdVender < ActiveRecord::Base
  attr_accessible :name, :artwork_size_list
  acts_as_taggable_on :artwork_sizes

  has_many :artwork_distributions
  has_many :artworks, :through => :artwork_distributions

  def artworks_package
    package_name = File.join Rails.root, "/tmp/#{name}_#{Time.now.strftime("%Y%m%d")}.zip"
    Zip::ZipFile.open(package_name, Zip::ZipFile::CREATE) do |zipfile|
      artworks.each do |artwork|
        url = File.join "public", artwork.artwork.url
        zipfile.add(File.basename(url), url)
      end
    end
    package_name
  end
end
