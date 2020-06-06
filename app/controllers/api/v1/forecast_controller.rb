class Api::V1::ForecastController < ApplicationController
  def index
    # weather_service = WeatherService.new
    # response = weather_service.get_forecast_info
    weather_results = WeatherResults.new
    response = weather_results.get_local_weather

    render json: response.body
  end
end
