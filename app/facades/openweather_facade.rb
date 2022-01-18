class OpenweatherFacade
  class << self
    def current_weather(lat, lon)
      payload = OpenweatherService.weather(lat, lon)
      CurrentWeather.new(payload[:current])
    end

    def daily_weather(lat, lon)
      payload = OpenweatherService.weather(lat, lon)
      payload[:daily][0..4].map do |daily|
        DailyWeather.new(daily)
      end
    end

    def hourly_weather(lat, lon)
      payload = OpenweatherService.weather(lat, lon)
      payload[:hourly][0..7].map do |hourly|
        HourlyWeather.new(hourly)
      end
    end

    def hourly_weather_uncapped(lat, lon)
      payload = OpenweatherService.weather(lat, lon)
      payload[:hourly].map do |hourly|
        HourlyWeather.new(hourly)
      end
    end
  end
end
