class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!, unless: :top_page?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def top_page?
    controller_name == 'top' && action_name == 'index'
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    units_path
  end
end
