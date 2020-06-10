require 'rails_helper'

RSpec.describe "Background Endpoints" do
  it "can retreive url for background image", :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    url = JSON.parse(response.body, symbolize_names: true)

    expect(url[:data][:attributes]).to have_key(:image)
  end
end
