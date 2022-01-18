class MapquestFacade
  class << self
    def place(location)
      payload = MapquestService.place(location)
      payload[:results].map do |result|
        Place.new(result[:locations].first)
      end
    end

    def road_trip(start, finish)
      payload = MapquestService.road_trip(start, finish)
      RoadTrip.new(payload[:route], start, finish)
    end
  end
end
