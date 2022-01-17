class Route
  attr_reader :start_city,
              :end_city,
              :travel_time

  def initialize(data, start, finish)
    @start_city = start
    @end_city = finish
    @travel_time = data[:formattedTime]
    # try passing start city into mapquest service to get lon, lat for weather at eta
  end
end
