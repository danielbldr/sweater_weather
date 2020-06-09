class ApplicationController < ActionController::API
  def authenticate_api_key
    User.find_by(api_key: params[:api_key])
  end
end
