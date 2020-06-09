class ForecastService
  include Convertable

  def get_forecast_info(lat, lon)
    params = { lat: lat, lon: lon, units: 'imperial' }
    get_json('data/2.5/onecall', params)
  end

  def get_arrival_forecast(lat, lon, time)
    forecast_info = get_forecast_info(lat, lon)
    index = to_hours(time)
    forecast_info[:hourly][index]
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.openweathermap.org') do |f|
      f.params['appid'] = 'f3fa19a39c077c30289cf9672ad2f599'
    end
  end
end
