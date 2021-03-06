require 'rails_helper'

RSpec.describe "User Endpoints" do
  it "can post new user to DB" do
    body = { "email": "whatever@example.com", "password": "password",
               "password_confirmation": "password" }

    post '/api/v1/users', params: body

    expect(response).to be_successful
    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(user_data[:data][:attributes]).to have_key(:email)
    expect(user_data[:data][:attributes]).to have_key(:api_key)
  end

  it "returns error when user tries to be added twice" do
    body = { "email": "whatever@example.com", "password": "password",
               "password_confirmation": "password" }

    post '/api/v1/users', params: body
    post '/api/v1/users', params: body

    expect(response).to_not be_successful
    user_data = JSON.parse(response.body, symbolize_names: true)

    expect(user_data[:email]).to eq(["has already been taken"])
  end
end
