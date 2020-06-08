class Background
  attr_reader :image, :id

  def initialize(location)
    @image = find_image(location)
    @id = nil
  end

  def find_image(location)
    city = location.split(',').first
    unsplash_results = Unsplash::Photo.search(city)
    unsplash_results.first.urls.raw
  end
end
