class Api::V1::RoadTripController < ApplicationController
  def create
    road_trip = MapquestFacade.road_trip(params[:origin], params[:destination])
    hours_taken = road_trip.hours_traveled
    weather_at_eta = road_trip.hourly_weather[hours_taken.to_i]
    user = User.find_by(api_key: params[:api_key])

    if user.present?
      render json: {data: { id: 'null', type: 'roadtrip', attributes: {start_city: road_trip.start_city, end_city: road_trip.end_city, travel_time: road_trip.travel_time, weather_at_eta: {temperature: weather_at_eta.temp, conditions: weather_at_eta.conditions}}}}
    else
      render json: "Please enter valid credentials", status:401
    end
  end
end
