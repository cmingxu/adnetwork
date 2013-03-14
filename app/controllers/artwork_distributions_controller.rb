class ArtworkDistributionsController < ApplicationController
  before_filter :find_ad_vender
  before_filter :find_ad, :except => [:index]

  def index
    @artwork_distributions = @ad_vender.artwork_distributions.page params[:page]
    render :index
  end

  def edit
  end

  def update
    if @ad.update_attributes(params[:artwork_distribution])
      redirect_to ad_vender_artwork_distributions_path(@ad_vender)
    else
      render :edit
    end
  end

  def destroy
    @ad.destroy
    redirect_to :back
  end

  protected
  def find_ad_vender
    @ad_vender = AdVender.find params[:ad_vender_id]
  end

  def find_ad
    @ad = @ad_vender.artwork_distributions.find params[:id]
  end
end
