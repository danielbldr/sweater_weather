require 'rails_helper'

RSpec.describe Direction do
  it 'has attributes' do
    data = { routes: [legs: [{ duration: {text: "1 hour 48 mins", value: 6479 } }] ] }

    direction = Direction.new(data)

    expect(direction.travel_time.class).to eq(String)
    expect(direction.seconds.class).to eq(Integer)
  end
end
