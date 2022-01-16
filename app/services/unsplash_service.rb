class UnsplashService
  class << self

    def conn
      Faraday.new("https://api.unsplash.com/")
    end

    def photo(search)
      response = conn.get("search/photos") do |req|
        req.params[:query] = search
        req.params[:client_id] = ENV["unsplash_api_key"]
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
