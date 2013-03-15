class Resolution < ActiveRecord::Base
  attr_accessible :resolution
  validates_uniqueness_of :resolution
  validate :resolution_format

  def resolution_format
    errors.add :resolution, "Invalid format, please use format like 400x300!" unless resolution =~ /\d+x\d+/
  end
end
