class ArtworkDistributionsController < ApplicationController
  before_filter :find_ad_vender

  def index
    @artwork_distributions = @ad_vender.artwork_distributions
    render :index
  end

  def edit
  end

  def destory
  end

  protected
  def find_ad_vender
    @ad_vender = AdVender.find params[:ad_vender_id]
  end
end
