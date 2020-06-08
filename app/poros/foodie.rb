class Foodie
  attr_reader :end_location, :travel_time, :forecast, :restaurant, :id

  def initialize(params)
    @end_location = params[:end]
    @travel_time = get_travel_time(params)
    @forecast = get_forecast(params)
    @restaurant = get_restaurant(params)
    @id = nil
  end

  private

  def get_travel_time(params)
    direction_service = DirectionService.new
    direction_service.get_travel_time(params[:start], params[:end])
  end

  def get_coords(params)
    geocode_service = GeocodeService.new
    geocode_service.get_coordinates(params[:end])
  end

  def get_forecast(params)
    coords = get_coords(params)
    forecast_results = ForecastResults.new
    forecast_results.get_forecast_summary(coords[:lat], coords[:lng])
  end

  def get_restaurant(params)
    coords = get_coords(params)
    zomato_service = ZomatoService.new
    zomato_service.get_restaurant(coords[:lat], coords[:lng], params[:search])
  end
end
