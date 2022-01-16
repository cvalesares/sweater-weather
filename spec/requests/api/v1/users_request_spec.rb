require 'rails_helper'

RSpec.describe 'Users Request' do
  it 'can create a user' do
    user_params = {
                    email: "bburger@yahoo.com",
                    password: "ihatejimmypesto",
                    password_confirmation: "ihatejimmypesto"
                  }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)
    created_user = User.last

    expect(response.status).to eq(201)
    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.password_digest).to be_a String
  end
end
