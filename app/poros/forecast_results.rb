class ForecastResults
  def get_local_weather(lat, lon)
    forecast_service = ForecastService.new
    response = forecast_service.get_forecast_info(lat, lon)
    CityForecast.new(response)
  end
end
