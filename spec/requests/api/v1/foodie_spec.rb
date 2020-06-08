require 'rails_helper'

RSpec.describe 'Foodie Endpoint' do
  it 'returns end city' do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful

    foodie_info = JSON.parse(response.body, symbolize_names: true)
    foodie_data = foodie_info[:data]
    foodie_attributes = foodie_data[:attributes]
    foodie_forecast = foodie_attributes[:forecast]
    foodie_restaurant = foodie_attributes[:restaurant]

    expect(foodie_attributes).to have_key(:end_location)
    expect(foodie_attributes).to have_key(:travel_time)
    expect(foodie_attributes).to have_key(:forecast)

    expect(foodie_forecast).to have_key(:summary)
    expect(foodie_forecast).to have_key(:temperature)

    expect(foodie_restaurant).to have_key(:name)
    expect(foodie_restaurant).to have_key(:address)
  end
end
