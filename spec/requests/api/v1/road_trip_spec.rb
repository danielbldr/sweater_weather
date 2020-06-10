require 'rails_helper'

RSpec.describe "Road Trip Endpoints" do
  it "can send road trip data with origin, destination, travel time, and arrival forecast", :vcr do
    allow(SecureRandom).to receive(:base58).and_return("jgn983hy48thw9begh98h4539h4")
    User.create( email: 'example@example.com', password: 'password')

    trip_params = { "origin": "Denver,CO", "destination": "Pueblo,CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4" }

    post '/api/v1/road_trip', params: trip_params

    expect(response).to be_successful

    trip_data = JSON.parse(response.body, symbolize_names: true)

    expect(trip_data[:data][:attributes]).to have_key(:origin)
    expect(trip_data[:data][:attributes]).to have_key(:destination)
    expect(trip_data[:data][:attributes]).to have_key(:travel_time)
    expect(trip_data[:data][:attributes]).to have_key(:arrival_forecast)

    expect(trip_data[:data][:attributes][:arrival_forecast]).to have_key(:temperature)
    expect(trip_data[:data][:attributes][:arrival_forecast]).to have_key(:summary)
  end

  it "cannot return info if parameters are absent", :vcr do
    trip_params = { "origin": "Denver,CO"}

    post '/api/v1/road_trip', params: trip_params

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    trip_data = JSON.parse(response.body, symbolize_names: true)
    expect(trip_data[:missing]).to eq('Missing parameters: destination and api_key')
  end

  it "cannot return info if API key is wrong", :vcr do
    allow(SecureRandom).to receive(:base58).and_return("wrong_api_key")
    User.create( email: 'example@example.com', password: 'password')

    trip_params = { "origin": "Denver,CO", "destination": "Pueblo,CO",
                    "api_key": "jgn983hy48thw9begh98h4539h4" }

    post '/api/v1/road_trip', params: trip_params

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    trip_data = JSON.parse(response.body, symbolize_names: true)
    expect(trip_data[:missing]).to eq('Missing parameter: api_key')
  end
end
