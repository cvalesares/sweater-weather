class MapquestService
  class << self

    def conn
      Faraday.new("http://www.mapquestapi.com/geocoding/v1/")
    end

    def place(location)
      response = conn.get("address") do |req|
        req.params[:key] = ENV["mapquest_api_key"]
        req.params[:location] = location
      end

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
