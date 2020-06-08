class HourlyForecast
  include Convertable
  attr_reader :time, :current_temp, :description

  def initialize(data)
    @time = current_time(data[:dt])
    @current_temp = data[:temp]
    @description = data[:weather].first[:main]
  end
end
