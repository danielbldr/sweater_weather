class HourlyForecast
  include Convertable

  def initialize(data)
    @time = current_time(data[:dt])
    @current_temp = data[:temp]
    @description = data[:weather].first[:main]
  end
end
