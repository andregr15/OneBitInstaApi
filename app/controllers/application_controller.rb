class ApplicationController < ActionController::API
  include ActionController::Helpers
  include ActionController::Flash
  
  respond_to :json
  
  acts_as_token_authentication_handler_for User

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :photo, :description])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :name, :photo, :description])
  end
end
