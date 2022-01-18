class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :final_latlng,
              :hourly_weather,
              :hours_traveled

  def initialize(data, start, finish)
    @start_city = start
    @end_city = finish
    if data[:routeError][:errorCode] == 2
      @travel_time = "impossible"
      @hourly_weather = ""
      @hours_traveled = ""
    else
      @travel_time = data[:formattedTime]
      @final_latlng = MapquestFacade.place(finish)
      @hourly_weather = OpenweatherFacade.hourly_weather_uncapped(@final_latlng.first.lat, @final_latlng.first.lng)
      @hours_traveled = data[:formattedTime].slice(0..1)
    end
  end
end
