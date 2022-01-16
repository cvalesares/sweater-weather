class Api::V1::UsersController < ApplicationController

  def create
    params[:api_key] = User.generate_api_key
    render json: UserSerializer.new(User.create!(user_params)), status:201
  end

  private
  def user_params
    params.permit(:email, :password, :api_key)
  end
end
