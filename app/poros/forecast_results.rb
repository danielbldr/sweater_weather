class ForecastResults
  def get_local_weather(location)
    geocode_service = GeocodeService.new
    coords = geocode_service.get_coordinates(location)

    forecast_service = ForecastService.new
    response = forecast_service.get_forecast_info(coords[:lat], coords[:lng])
    CityForecast.new(response)
  end

  def get_forecast_summary(lat, lon, time)
    forecast_service = ForecastService.new
    response = forecast_service.get_arrival_forecast(lat, lon, time)
    ForecastSummary.new(response)
  end
end
