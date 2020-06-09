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

  it 'can get forecast summary' do
    forecast_results = ForecastResults.new
    forecast_summary = forecast_results.get_forecast_summary(39.74, -104.99, 600)

    expect(forecast_summary.class).to eq(ForecastSummary)
  end
end
