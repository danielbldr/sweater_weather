class Trip
  attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
    @travel_time = get_travel_time(params).travel_time
    @arrival_forecast = get_forecast(params, get_travel_time(params).seconds)
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

  def get_forecast(params, time)
    coords = get_coords(params)
    forecast_results = ForecastResults.new
    forecast_results.get_forecast_summary(coords[:lat], coords[:lng], time)
  end
end
