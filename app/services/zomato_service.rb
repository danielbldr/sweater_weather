class ZomatoService
  def get_restaurant(lat, lon, query)
    params = { lat: lat, lon: lon, q: query}
    restaurant_info = get_json('/api/v2.1/search', params)
    Restaurant.new(restaurant_info)
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://developers.zomato.com') do |f|
      f.headers['user-key'] = ENV['ZOMATO_API']
    end
  end
end
