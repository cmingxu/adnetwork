class ApplicationController < ActionController::Base
  layout :layout_by_resource
  protect_from_forgery
  before_filter :authenticate_user!

  protected
  def layout_by_resource
    if devise_controller?
      "account"
    else
      "application"
    end
  end
end
