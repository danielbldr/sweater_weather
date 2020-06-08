class Api::V1::ForecastController < ApplicationController
  def index
    forecast_results = ForecastResults.new
    city_forecast = forecast_results.get_local_weather(params[:location])

    render json: ForecastSerializer.new(city_forecast).serializable_hash
  end
end
