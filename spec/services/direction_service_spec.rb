require 'rails_helper'

RSpec.describe DirectionService do
  it 'can get coordinates of a city' do
    direction_service = DirectionService.new
    time = direction_service.get_travel_time('denver,co', 'pueblo,co')

    expect(time).to eq("1 hour 48 mins")
  end

  it 'can get coordinates of a different city' do
    direction_service = DirectionService.new
    time = direction_service.get_travel_time('denver,co', 'irvine,co')

    expect(time).to eq("15 hours 18 mins")
  end
end
