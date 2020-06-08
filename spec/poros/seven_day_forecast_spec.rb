require 'rails_helper'

RSpec.describe SevenDayForecast do
  it 'has attributes' do
    data = File.read('lib/mock/denver_forecast.json')
    forecast_info = JSON.parse(data, symbolize_names: true)
    forecast_info = JSON.parse(forecast_info, symbolize_names: true)

    seven_day_forecast = SevenDayForecast.new(forecast_info[:daily].first)

    expect(seven_day_forecast.description).to eq('Clear')
    expect(seven_day_forecast.precipitation).to eq(nil)
    expect(seven_day_forecast.high).to eq(79.48)
    expect(seven_day_forecast.low).to eq(76.39)
    expect(seven_day_forecast.day).to eq('Sunday')
  end
end
