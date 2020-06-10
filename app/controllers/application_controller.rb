class ApplicationController < ActionController::API
  require 'active_support/inflector'

  def authenticate_api_key
    User.find_by(api_key: params[:api_key])
  end
end
