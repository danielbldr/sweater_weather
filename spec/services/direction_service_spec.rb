require 'rails_helper'

RSpec.describe DirectionService do
  it 'can get coordinates of a city', :vcr do
    direction_service = DirectionService.new
    time = direction_service.get_travel_time('denver,co', 'pueblo,co')

    expect(time.travel_time.class).to eq(String)
    expect(time.seconds.class).to eq(Integer)
  end

  it 'can get coordinates of a different city', :vcr do
    direction_service = DirectionService.new
    time = direction_service.get_travel_time('denver,co', 'irvine,co')

    expect(time.travel_time.class).to eq(String)
    expect(time.seconds.class).to eq(Integer)
  end
end
