class OpenweatherFacade

  #not sure how I want this data formatted yet
  def self.current_weather(lat, lon)
    payload = OpenweatherService.weather(lat, lon)
    Weather.new(payload[:current])
  end
end
