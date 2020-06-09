require 'rails_helper'

RSpec.describe Direction do
  it 'has attributes' do
    data = { routes: [legs: [{ duration: {text: "1 hour 48 mins", value: 6479 } }] ] }

    direction = Direction.new(data)

    expect(direction.travel_time).to eq("1 hour 48 mins")
    expect(direction.seconds).to eq(6479)
  end
end
