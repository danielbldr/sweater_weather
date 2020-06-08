class DailyForecast
  include Convertable
  attr_reader :current_temp,
              :time,
              :high,
              :low,
              :description,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :sunrise,
              :sunset

  def initialize(data)
    @current_temp = data[:current][:temp]
    @time = current_time(data[:current][:dt])
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
