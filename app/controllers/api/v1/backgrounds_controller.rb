class Api::V1::BackgroundsController < ApplicationController
  def index
    photo = UnsplashFacade.photo(params[:location]).first
    render json: {data: {type: 'image', id: 'null', attributes: { image: photo}}}
    #render json: BackgroundSerializer.new(UnsplashFacade(params[:location]))
  end
end
