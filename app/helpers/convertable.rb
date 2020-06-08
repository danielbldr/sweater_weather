module Convertable
  def current_time(unix_time)
    time = Time.at(unix_time)
    time.strftime('%I:%M %p, %b %d')
  end

  def to_mile(meters)
    unless meters.nil?
      miles = meters * 0.000621371
      '%.2f' % miles + ' miles'
    end
  end

  def to_day(unix_time)
    time = Time.at(unix_time)
    time.strftime("%A")
  end

  def to_time(unix_time)
    time = Time.at(unix_time)
    time.strftime('%I:%M %p')
  end
end
