class Api::V1::FoodieController < ApplicationController
  def index
    direction_service = DirectionService.new
    time = direction_service.get_travel_time(params[:start], params[:end])

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

    params = {end_location: end_location,
              travel_time: time,
              forecast: forecast_summary,
              restaurant: { name: name, address: address }}
    foodie = Foodie.new(params)
    render json: FoodieSerializer.new(foodie).serializable_hash
  end
end
