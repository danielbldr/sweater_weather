class Api::V1::FoodieController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.params[:key] = ENV['GOOGLE_API']
    end

    response = conn.get('/maps/api/directions/json') do |req|
      req.params[:origin] = params[:start]
      req.params[:destination] = params[:end]
    end

    directions = JSON.parse(response.body, symbolize_names: true)
    time = directions[:routes].first[:legs].first[:duration][:text]
    end_location = params[:end]

    geocode_service = GeocodeService.new
    coords = geocode_service.get_coordinates(params[:end])

    forecast_results = ForecastResults.new
    forecast_summary = forecast_results.get_forecast_summary(coords[:lat],
                                                             coords[:lng])

    conn = Faraday.new(url: 'https://developers.zomato.com') do |f|
      f.headers['user-key'] = ENV['ZOMATO_API']
    end

    response = conn.get('/api/v2.1/search') do |req|
      req.params[:lat] = coords[:lat]
      req.params[:lon] = coords[:lng]
      req.params[:q] = params[:search]
    end

    restaurants = JSON.parse(response.body, symbolize_names: true)

    name = restaurants[:restaurants].first[:restaurant][:name]
    address = restaurants[:restaurants].first[:restaurant][:location][:address]
    require "pry"; binding.pry
  end
end
