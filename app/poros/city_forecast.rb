class CityForecast
  include Convertable
  attr_reader :hourly, :seven_day, :daily, :id, :location

  def initialize(data)
    @location = data[:timezone]
    @hourly = create_hourly_forcast(data[:hourly])
    @seven_day = create_seven_day_forecast(data[:daily])
    @daily = DailyForecast.new(data)
    @id = 1
  end

  private

  def create_hourly_forcast(hourly_data)
    hourly_data[0..7].map do |hour|
      HourlyForecast.new(hour)
    end
  end

  def create_seven_day_forecast(daily_data)
    daily_data[0..6].map do |day|
      SevenDayForecast.new(day)
    end
  end
end
