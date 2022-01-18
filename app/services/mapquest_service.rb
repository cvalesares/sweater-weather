class MapquestService
  class << self

    def conn
      Faraday.new("http://www.mapquestapi.com")
    end

    def place(location)
      response = conn.get("/geocoding/v1/address") do |req|
        req.params[:key] = ENV["mapquest_api_key"]
        req.params[:location] = location
      end

      JSON.parse(response.body, symbolize_names: true)
    end

    def road_trip(start, finish)
      response = conn.get("/directions/v2/route") do |req|
        req.params[:key] = ENV["mapquest_api_key"]
        req.params[:from] = start
        req.params[:to] = finish
      end

      JSON.parse(response.body, symbolize_names: true)
    end

  end
end
