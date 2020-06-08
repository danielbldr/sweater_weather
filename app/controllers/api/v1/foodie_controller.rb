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
  end
end
