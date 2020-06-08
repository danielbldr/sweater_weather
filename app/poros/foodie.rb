class Foodie
  attr_reader :end_location, :travel_time, :forecast, :restaurant, :id

  def initialize(params)
    @end_location = params[:end_location]
    @travel_time = params[:travel_time]
    @forecast = params[:forecast]
    @restaurant = params[:restaurant]
    @id = nil
  end
end
