class Api::V1::RoadTripController < ApplicationController
  before_action :authenticate_api_key

  def create
    return error unless authenticate_api_key

    trip = Trip.new(trip_params)
    render json: TripSerializer.new(trip).serializable_hash
  end

  private

  def trip_params
    params.permit(:origin, :destination)
  end

  def error
    if params[:api_key]
      render json: { api_key: ['Incorrect API key'] }, status: :unauthorized
    else
      render json: { api_key: ['API key required'] }, status: :unauthorized
    end
  end
end
