class Api::V1::ForecastController < ApplicationController
  def index
    weather_service = WeatherService.new
    response = weather_service.get_forecast_info
    render json: response.body
  end
end
