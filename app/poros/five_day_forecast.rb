class FiveDayForecast
  attr_reader :description, :precipitation, :high, :low, :day
  def initialize(json_info)
    @description = json_info[:weather].first[:main]
    @precipitation = json_info[:rain] || json_info[:snow]
    @high = json_info[:temp][:max]
    @low = json_info[:temp][:min]
    @day = to_day(json_info[:dt])
  end

  def to_day(unix_time)
    time = Time.at(unix_time)
    time.strftime("%A")
  end
end
