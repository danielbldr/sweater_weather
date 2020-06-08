class DailyForecast
  include Convertable

  def initialize(data)
    @current_temp = current_time(data[:current][:dt])
    @high = data[:daily].first[:temp][:max]
    @low = data[:daily].first[:temp][:min]
    @description = data[:current][:weather].first[:description]
    @feels_like = data[:current][:feels_like]
    @humidity = data[:current][:humidity]
    @visibility = to_mile(data[:current][:visibility])
    @uv_index = data[:current][:uvi]
    @sunrise = to_time(data[:current][:sunrise])
    @sunset = to_time(data[:current][:sunset])
  end
end
