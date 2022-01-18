require 'rails_helper'

RSpec.describe 'Users Request' do
  before :each do
    @user_params = {
      email: "bburger@yahoo.com",
      password: "ihatejimmypesto",
      password_confirmation: "ihatejimmypesto"
    }
    @headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/users", headers: @headers, params: JSON.generate(@user_params)
    @created_user = User.last
  end

  it 'can create a user' do
    expect(response.status).to eq(201)
    expect(@created_user.email).to eq(@user_params[:email])
    expect(@created_user.password_digest).to be_a String
  end

  it 'can successfully log in a user' do
    post "/api/v1/sessions", headers: @headers, params: JSON.generate(@user_params)

    expect(response.status).to eq(200)
  end

  it 'returns an error on bad log in attempt' do
    bad_params = {
      email: "bburger@yahoo.com",
      password: "ilovejimmypesto",
      password_confirmation: "ilovejimmypesto"
    }
    post "/api/v1/sessions", headers: @headers, params: JSON.generate(bad_params)

    expect(response.status).to eq(400)
    expect(response.body).to eq("Invalid Credentials")
  end
end
