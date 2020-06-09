require 'rails_helper'

RSpec.describe ForecastSummary do
  it 'has attributes' do
    data = File.read('lib/mock/denver_forecast.json')
    forecast_info = JSON.parse(data, symbolize_names: true)
    forecast_info = JSON.parse(forecast_info, symbolize_names: true)

    trip = ForecastSummary.new(forecast_info[:current])

    expect(trip.summary).to_not be_blank
    expect(trip.temperature).to_not be_blank
  end
end
