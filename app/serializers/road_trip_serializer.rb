class RoadTripSerializer
  include JSONAPI::Serializer
  attributes :start_city, :end_city, :travel_time
end
