class OpenlibraryFacade
  class << self
    def books(city, limit)
      payload = OpenlibraryService.books(city, limit)
      payload[:docs].map do |doc|
        Book.new(doc)
      end
    end

    def books_found(city, limit)
      payload = OpenlibraryService.books(city, limit)
    end
  end
end
