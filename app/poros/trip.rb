class Trip
  attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
    @travel_time = get_travel_time(params)
    @arrival_forecast = get_forecast(params)
    @id = nil
  end

  private

  def get_travel_time(params)
    direction_service = DirectionService.new
    direction_service.get_travel_time(params[:origin], params[:destination])
  end

  def get_coords(params)
    geocode_service = GeocodeService.new
    geocode_service.get_coordinates(params[:destination])
  end

  def get_forecast(params)
    coords = get_coords(params)
    forecast_results = ForecastResults.new
    forecast_results.get_forecast_summary(coords[:lat], coords[:lng])
  end
end
