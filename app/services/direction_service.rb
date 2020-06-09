class DirectionService
  def get_travel_time(origin, destination)
    params = { origin: origin, destination: destination }
    directions = get_json('/maps/api/directions/json', params)

    directions[:routes].first[:legs].first[:duration][:text]
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
