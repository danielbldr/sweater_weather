class Api::V1::RoadTripController < ApplicationController
  def create
    return error unless authenticate_api_key && all_params?

    trip = Trip.new(trip_params)
    render json: TripSerializer.new(trip).serializable_hash
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def error
    missing = required_params.find_all { |param| params[param].nil? }
    missing << 'api_key' if params[:api_key] && !authenticate_api_key
    render json: { missing: message(missing) }, status: :unauthorized
  end

  def message(missing)
    "Missing #{'parameter'.pluralize(missing.length)}: #{missing.to_sentence}"
  end

  def required_params
    %w[origin destination api_key]
  end

  def all_params?
    required_params.all? { |param| params.include?(param) }
  end
end
