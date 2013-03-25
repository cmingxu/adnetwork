class AnalyticSumsController < ApplicationController

  layout :false

  def index
    @query_params = params[:query] || {}
    @order_params = params[:order] || {:attr => :impression, :direction => 'DESC'}

    @analytic_sums = AnalyticSum.query(@query_params, @order_params).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analytic_sums }
    end
  end
end
