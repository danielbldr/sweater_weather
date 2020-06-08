require 'rails_helper'

RSpec.describe CityForecast do
  it 'has attributes' do
    data = File.read('lib/mock/denver_forecast.json')
    forecast_info = JSON.parse(data, symbolize_names: true)
    forecast_info = JSON.parse(forecast_info, symbolize_names: true)

    city_forecast = CityForecast.new(forecast_info)
    expect(city_forecast.hourly.first.class).to eq(HourlyForecast)
    expect(city_forecast.daily.class).to eq(DailyForecast)
    expect(city_forecast.seven_day.first.class).to eq(SevenDayForecast)

    expect(city_forecast.hourly.count).to eq(8)
    expect(city_forecast.seven_day.count).to eq(7)
  end
end
