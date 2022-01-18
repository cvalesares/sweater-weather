class OpenlibraryFacade

  def self.books(city, limit)
    payload = OpenlibraryService.books(city, limit)
    payload[:docs].map do |doc|
      Book.new(doc)
    end
  end
end
