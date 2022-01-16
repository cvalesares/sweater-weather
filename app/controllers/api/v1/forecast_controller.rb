class Api::V1::ForecastController < ApplicationController
  def index
    place = MapquestFacade.place(params[:location]).first
    current = OpenweatherFacade.current_weather(place.lat, place.lng)
    daily = OpenweatherFacade.daily_weather(place.lat, place.lng)
    hourly = OpenweatherFacade.hourly_weather(place.lat, place.lng)

    render json: {data: { id: 'null', type: 'forecast', attributes: {current_weather: current, daily_weather: daily, hourly_weather: hourly}}}
  end
end
