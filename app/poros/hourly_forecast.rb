class HourlyForecast
  def initialize(json_info)
    @time = json_info[:dt]
    @current_temp = json_info[:temp]
    @description = json_info[:weather].first[:main]
  end
end
