class ForecastSummary
  attr_reader :temperature, :summary

  def initialize(data)
    @summary = data[:current][:weather].first[:description]
    @temperature = data[:current][:temp]
  end
end
