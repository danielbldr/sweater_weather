class CityForecast
  attr_reader :hourly_forcast, :five_day_forecast, :daily_forecast

  def initialize(json_info)
    @hourly_forecast = create_hourly_forcast(json_info[:hourly])
    @five_day_forecast = create_five_day_forecast(json_info[:daily])
    @daily_forecast = DailyForecast.new(json_info)
  end

  def create_hourly_forcast(hourly_info)
    @hourly_forcast ||= hourly_info[0..7].map do |hour|
      HourlyForecast.new(hour)
    end
  end

  def create_five_day_forecast(daily_info)
    @five_day_forecast ||= daily_info[0..4].map do |day|
      FiveDayForecast.new(day)
    end
  end
end
