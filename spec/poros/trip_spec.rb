require 'rails_helper'

RSpec.describe Trip do
  it 'has attributes' do
    trip = Trip.new({ origin: 'denver,co', destination: 'pueblo,co' })

    expect(trip.origin).to eq('denver,co')
    expect(trip.destination).to eq('pueblo,co')
    expect(trip.travel_time).to_not be_blank
    expect(trip.arrival_forecast).to_not be_blank
  end
end
