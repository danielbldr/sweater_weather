class DailyForecast
  def initialize(forecast_info)
    @current_temp = current_time(forecast_info[:current][:dt])
    @high = forecast_info[:daily].first[:temp][:max]
    @low = forecast_info[:daily].first[:temp][:min]
    @description = forecast_info[:current][:weather].first[:description]
    @feels_like = forecast_info[:current][:feels_like]
    @humidity = forecast_info[:current][:humidity]
    @visibility = to_mile(forecast_info[:current][:visibility])
    @uv_index = forecast_info[:current][:uvi]
    @sunrise = forecast_info[:current][:sunrise]
    @sunset = forecast_info[:current][:sunset]
  end

  def current_time(unix_time)
    time = Time.at(unix_time)
    time.strftime('%I:%M %p, %b %d')
  end

  def to_mile(meters)
    meters * 0.000621371 unless meters.nil?
  end
end
