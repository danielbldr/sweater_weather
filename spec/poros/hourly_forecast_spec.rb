require 'rails_helper'

RSpec.describe HourlyForecast do
  it 'has attributes' do
    data = File.read('lib/mock/denver_forecast.json')
    forecast_info = JSON.parse(data, symbolize_names: true)
    forecast_info = JSON.parse(forecast_info, symbolize_names: true)

    hourly_forecast = HourlyForecast.new(forecast_info[:hourly].first)

    expect(hourly_forecast.current_temp).to eq(79.48)
    expect(hourly_forecast.time).to eq("09:00 PM, Jun 07")
    expect(hourly_forecast.description).to eq('Clear')
  end
end
