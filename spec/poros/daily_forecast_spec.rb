require 'rails_helper'

RSpec.describe DailyForecast do
  it 'has attributes' do
    data = File.read('lib/mock/denver_forecast.json')
    forecast_info = JSON.parse(data, symbolize_names: true)
    forecast_info = JSON.parse(forecast_info, symbolize_names: true)

    daily_forecast = DailyForecast.new(forecast_info)

    expect(daily_forecast.current_temp).to eq(79.48)
    expect(daily_forecast.high).to eq(79.48)
    expect(daily_forecast.low).to eq(76.39)
    expect(daily_forecast.description).to eq('clear sky')
    expect(daily_forecast.feels_like).to eq(72.84)
    expect(daily_forecast.humidity).to eq(11)
    expect(daily_forecast.visibility).to eq(nil)
    expect(daily_forecast.uv_index).to eq(10.93)
    expect(daily_forecast.sunrise).to eq("05:32 AM")
    expect(daily_forecast.sunset).to eq("08:26 PM")
  end
end
