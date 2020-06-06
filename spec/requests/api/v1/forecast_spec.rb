require 'rails_helper'

RSpec.describe "Forecast Endpoints" do
  it "can retreive weather data for a city" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    weather_info = JSON.parse(response.body, symbolize_names: true)
    expect(weather_info[:lat]).to eq(39.74)
    expect(weather_info[:lon]).to eq(-104.99)
    expect(weather_info[:timezone]).to eq('America/Denver')

    expect(weather_info).to have_key(:current)
    expect(weather_info).to have_key(:hourly)
    expect(weather_info).to have_key(:daily)
  end
end
