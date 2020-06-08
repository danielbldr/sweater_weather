class Api::V1::ForecastController < ApplicationController
  def index
    geocode_service = GeocodeService.new
    coords = geocode_service.get_coordinates(params[:location])

    forecast_results = ForecastResults.new
    city_forecast = forecast_results.get_local_weather(coords[:lat],
                                                       coords[:lng])

    render json: ForecastSerializer.new(city_forecast).serializable_hash
  end
end
