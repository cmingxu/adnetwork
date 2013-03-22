module AnalyticDataHelper
  def order_icon(attr)
    return unless attr.to_s == @order_params[:attr]
    if @order_params[:direction] == 'ASC'
      engine = Haml::Engine.new("%i.icon-chevron-up")
    else
      engine = Haml::Engine.new("%i.icon-chevron-down")
    end
    engine.render
  end
end
