require 'rails_helper'

RSpec.describe ForecastService do
  it 'can get forecast info forecast info for a city', :vcr do
    forecast_service = ForecastService.new
    json = forecast_service.get_forecast_info(39.74, -104.99)

    expect(json[:timezone]).to eq('America/Denver')
    expect(json[:lat]).to eq(39.74)
    expect(json[:lon]).to eq(-104.99)
  end

  it 'can get forecast info forecast info for a different city', :vcr do
    forecast_service = ForecastService.new
    json = forecast_service.get_forecast_info(33.72, -117.83)

    expect(json[:timezone]).to eq('America/Los_Angeles')
    expect(json[:lat]).to eq(33.72)
    expect(json[:lon]).to eq(-117.83)
  end
end
