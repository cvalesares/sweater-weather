class MapquestFacade
  def self.place(location)
    test = MapquestService.place(location)
    test[:results].map do |result|
      Place.new(result)
    end
  end
end
