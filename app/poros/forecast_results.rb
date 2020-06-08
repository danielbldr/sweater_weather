class ForecastResults
  def get_local_weather(location)
    geocode_service = GeocodeService.new
    coords = geocode_service.get_coordinates(location)

    forecast_service = ForecastService.new
    response = forecast_service.get_forecast_info(coords[:lat], coords[:lng])
    CityForecast.new(response)
  end
end
