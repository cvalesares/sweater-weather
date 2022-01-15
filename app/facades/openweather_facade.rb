class OpenweatherFacade

  def self.current_weather(lat, lon)
    payload = OpenweatherService.weather(lat, lon)
    CurrentWeather.new(payload[:current])
  end

  def self.daily_weather(lat, lon)
    payload = OpenweatherService.weather(lat, lon)
    payload[:daily][0..4].map do |daily|
      DailyWeather.new(daily)
    end
  end
end
