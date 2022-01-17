class MapquestFacade
  class << self
    def place(location)
      payload = MapquestService.place(location)
      payload[:results].map do |result|
        Place.new(result[:locations].first)
      end
    end

    def route(start, finish)
      payload = MapquestService.route(start, finish)
      Route.new(payload[:route], start, finish)
    end
  end
end
