class Api::V1::BookSearchController < ApplicationController
  def index
    latlng = MapquestFacade.place(params[:location])
    weather = OpenweatherFacade.current_weather(latlng.first.lat, latlng.first.lng)
    book = OpenlibraryFacade.books(params[:location], params[:quantity])
    books_found = OpenlibraryFacade.books_found(params[:location], params[:quantity])

    render json: {data: { id: 'null', type: 'books', attributes: {destination: params[:location], forecast: {summary: weather.conditions, temperature: weather.temp}, total_books_found: books_found[:numFound], books: book}}}
  end
end
