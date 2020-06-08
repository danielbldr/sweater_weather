class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :hourly, :seven_day, :daily, :location
end
