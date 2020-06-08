require 'rails_helper'

RSpec.describe 'Foodie Endpoint' do
  it 'returns end city, estimated time of travel, restaurant info, and forecast' do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful

    foodie_info = JSON.parse(response.body, symbolize_names: true)
    foodie_data = foodie_info[:data]
    attributes = foodie_data[:attributes]
    forecast = attributes[:forecast]
    restaurant = attributes[:restaurant]

    expect(attributes).to have_key(:end_location)
    expect(attributes).to have_key(:travel_time)
    expect(attributes).to have_key(:forecast)

    expect(forecast).to have_key(:summary)
    expect(forecast).to have_key(:temperature)

    expect(restaurant).to have_key(:name)
    expect(restaurant).to have_key(:address)
  end
end
