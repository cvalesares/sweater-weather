class Place
  attr_reader :lat,
              :lng

  def initialize(data)
    @lat = data[:lat]
    @lng = data[:lng]
    # @lat = data[:locations].first[:latLng][:lat]
    # @lng = data[:locations].first[:latLng][:lng]
  end
end
