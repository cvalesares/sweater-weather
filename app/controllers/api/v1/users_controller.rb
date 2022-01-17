class Api::V1::UsersController < ApplicationController

  def create
    params[:api_key] = User.generate_api_key
    render json: UserSerializer.new(User.create!(user_params)), status:201
  end

  def login
    user = User.find_by(email: user_params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status:200
    else
      render json: "Invalid Credentials", status:400
    end
  end

  private
  def user_params
    params.permit(:email, :password, :api_key)
  end
end
