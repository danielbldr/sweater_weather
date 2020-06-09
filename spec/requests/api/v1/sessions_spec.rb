require 'rails_helper'

RSpec.describe "Session Endpoints" do
  it "can post new user to DB" do
    create_params = { "email": "whatever@example.com", "password": "password",
                      "password_confirmation": "password" }
    sessions_params = { "email": "whatever@example.com", "password": "password" }

    post '/api/v1/users', params: create_params
    post '/api/v1/sessions', params: sessions_params

    expect(response).to be_successful
    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(user_data[:data][:attributes]).to have_key(:email)
    expect(user_data[:data][:attributes]).to have_key(:api_key)
  end

  it "returns error if password is invalid" do
    create_params = { "email": "whatever@example.com", "password": "password",
                      "password_confirmation": "password" }
    sessions_params = { "email": "whatever@example.com", "password": "PassworD" }

    post '/api/v1/users', params: create_params
    post '/api/v1/sessions', params: sessions_params

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    
    user_data = JSON.parse(response.body, symbolize_names: true)

    expect(user_data[:password]).to eq(["Invalid password"])
  end

  it "returns error if email doesn't exist" do
    create_params = { "email": "whatever@example.com", "password": "password",
                      "password_confirmation": "password" }
    sessions_params = { "email": "what@example.com", "password": "password" }

    post '/api/v1/users', params: create_params
    post '/api/v1/sessions', params: sessions_params

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    user_data = JSON.parse(response.body, symbolize_names: true)

    expect(user_data[:email]).to eq(["Invalid email address"])
  end
end
