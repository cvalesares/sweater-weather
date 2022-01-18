class OpenlibraryService
  class << self

    def conn
      Faraday.new("https://openlibrary.org")
    end

    def books(city, limit)
      response = conn.get("/subjects/denver.json") do |req|
        req.params[:limit] = limit
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
