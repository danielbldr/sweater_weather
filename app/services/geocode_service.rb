class GeocodeService
  def get_coordinates(location)
    params = { address: location }
    response = get_json('/maps/api/geocode/json', params)
    response[:results].first[:geometry][:location]
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |f|
      f.params[:key] = ENV['GOOGLE_API']
    end
  end
end
