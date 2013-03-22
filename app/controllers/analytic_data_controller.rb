class AnalyticDataController < ApplicationController

  layout :false

  def index
    @query_params = params[:query] || {}
    @order_params = params[:order] || {:attr => :report_date, :direction => 'DESC'}

    @analytic_data = AnalyticDatum.query(@query_params, @order_params).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analytic_data }
    end
  end
end
