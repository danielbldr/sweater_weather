class ForecastSummary
  attr_reader :temperature, :summary

  def initialize(data)
    @summary = data[:weather].first[:description]
    @temperature = data[:temp]
  end
end
