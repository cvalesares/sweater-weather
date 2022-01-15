class Place
  attr_reader :lat,
              :lng

  def initialize(data)
    @lat = data[:latLng][:lat]
    @lng = data[:latLng][:lng]
  end
end
