class WeatherResults
  def get_local_weather
    weather_service = WeatherService.new
    response = weather_service.get_forecast_info
    x = CityForecast.new(response)
    require "pry"; binding.pry
  end
end
