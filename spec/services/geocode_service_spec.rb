require 'rails_helper'

RSpec.describe GeocodeService do
  it 'can get coordinates of a city', :vcr do
    goecode_service = GeocodeService.new
    coords = goecode_service.get_coordinates('denver,co')

    expect(coords[:lat]).to eq(39.7392358)
    expect(coords[:lng]).to eq(-104.990251)
  end

  it 'can get coordinates of a different city', :vcr do
    goecode_service = GeocodeService.new
    coords = goecode_service.get_coordinates('irvine,co')

    expect(coords[:lat]).to eq(33.6168308)
    expect(coords[:lng]).to eq(-117.8715267)
  end
end
