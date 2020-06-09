class Direction
  attr_reader :travel_time, :seconds

  def initialize(data)
    @travel_time = data[:routes].first[:legs].first[:duration][:text]
    @seconds = data[:routes].first[:legs].first[:duration][:value]
  end
end
