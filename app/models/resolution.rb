class Resolution < ActiveRecord::Base
  attr_accessible :resolution
  validates :resolution,
            :format => { :with => /\d+x\d+/, :message => "Invalid format, please use format like 400x300!" },
            :uniqueness => true,
            :presence => true
end
