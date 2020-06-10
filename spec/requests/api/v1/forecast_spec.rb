require 'rails_helper'

RSpec.describe "Forecast Endpoints" do
  it "can retreive weather data for a city", :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    weather_info = JSON.parse(response.body, symbolize_names: true)
    weather_attributes = weather_info[:data][:attributes]

    expect(weather_attributes).to have_key(:hourly)
    expect(weather_attributes).to have_key(:seven_day)
    expect(weather_attributes).to have_key(:daily)
    expect(weather_attributes).to have_key(:location)

    expect(weather_attributes[:location]).to eq('America/Denver')

    expect(weather_attributes[:hourly].count).to eq(8)
    expect(weather_attributes[:seven_day].count).to eq(7)

    expect(weather_attributes[:hourly].first).to have_key(:time)
    expect(weather_attributes[:hourly].first).to have_key(:current_temp)
    expect(weather_attributes[:hourly].first).to have_key(:description)

    expect(weather_attributes[:seven_day].first).to have_key(:description)
    expect(weather_attributes[:seven_day].first).to have_key(:precipitation)
    expect(weather_attributes[:seven_day].first).to have_key(:high)
    expect(weather_attributes[:seven_day].first).to have_key(:low)
    expect(weather_attributes[:seven_day].first).to have_key(:day)

    expect(weather_attributes[:daily]).to have_key(:current_temp)
    expect(weather_attributes[:daily]).to have_key(:high)
    expect(weather_attributes[:daily]).to have_key(:low)
    expect(weather_attributes[:daily]).to have_key(:description)
    expect(weather_attributes[:daily]).to have_key(:feels_like)
    expect(weather_attributes[:daily]).to have_key(:humidity)
    expect(weather_attributes[:daily]).to have_key(:visibility)
    expect(weather_attributes[:daily]).to have_key(:uv_index)
    expect(weather_attributes[:daily]).to have_key(:sunrise)
    expect(weather_attributes[:daily]).to have_key(:sunset)
  end
end
