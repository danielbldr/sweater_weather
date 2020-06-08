module Convertable
  def current_time(unix_time)
    time = Time.zone.at(unix_time)
    time.strftime('%I:%M %p, %b %d')
  end

  def to_mile(meters)
    return if meters.nil?

    miles = meters * 0.000621371
    format('%<miles>.2f', miles: miles) + ' miles'
  end

  def to_day(unix_time)
    time = Time.zone.at(unix_time)
    time.strftime('%A')
  end

  def to_time(unix_time)
    time = Time.zone.at(unix_time)
    time.strftime('%I:%M %p')
  end
end
