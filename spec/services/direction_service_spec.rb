require 'rails_helper'

RSpec.describe DirectionService do
  it 'can get coordinates of a city', :vcr do
    direction_service = DirectionService.new
    time = direction_service.get_travel_time('denver,co', 'pueblo,co')

    expect(time.travel_time).to eq("1 hour 48 mins")
    expect(time.seconds).to eq(6479)
  end

  it 'can get coordinates of a different city', :vcr do
    direction_service = DirectionService.new
    time = direction_service.get_travel_time('denver,co', 'irvine,co')

    expect(time.travel_time).to eq("15 hours 18 mins")
    expect(time.seconds).to eq(54530)
  end
end
