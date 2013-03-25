class VenderFeedback < ActiveRecord::Base
  belongs_to :product
  belongs_to :ad_vender
  has_many :analytic_data
  attr_accessible :chart, :platform

  def import_csv(csv)
    
  end
end
