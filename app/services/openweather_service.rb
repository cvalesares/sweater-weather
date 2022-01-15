class OpenweatherService
  class << self

    def conn
      Faraday.new("https://api.openweathermap.org/data/2.5/")
    end

    def weather(lat, lon)
      response = conn.get("onecall") do |req|
        req.params[:lat] = lat
        req.params[:lon] = lon
        req.params[:appid] = ENV["open_weather_api_key"]
        req.params[:units] = "imperial"
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
