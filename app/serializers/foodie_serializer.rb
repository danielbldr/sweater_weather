class FoodieSerializer
  include FastJsonapi::ObjectSerializer

  attributes :end_location, :forecast, :restaurant, :travel_time
end
