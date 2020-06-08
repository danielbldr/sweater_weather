require 'rails_helper'

RSpec.describe ForecastResults do
  it 'can get local weather data' do
    data = File.read('lib/mock/denver_forecast.json')
    forecast_info = JSON.parse(data, symbolize_names: true)
    forecast_info = JSON.parse(forecast_info, symbolize_names: true)

    results = ForecastResults.new
    city_forecast = results.get_local_weather('denver,co')

    expect(city_forecast.class).to eq(CityForecast)
  end
end
