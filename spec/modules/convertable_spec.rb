require 'rails_helper'

RSpec.describe Convertable do
  include Convertable

  it 'can convert unix time to standard time' do
    expect(current_time(1591724885)).to eq('11:48 AM, Jun 09')
  end

  it 'can convert meters to miles' do
    expect(to_mile(10000)).to eq('6.21 miles')
  end

  it 'can convert unix time to day of the week' do
    expect(to_day(1591724885)).to eq('Tuesday')
  end

  it 'can convert unix time to current time' do
    expect(to_time(1591724885)).to eq('11:48 AM')
  end

  it 'can convert seconds to closet hour' do
    expect(to_hours(6479)).to eq(2)
  end
end
