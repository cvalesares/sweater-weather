require 'rails_helper'

RSpec.describe 'Roadtrip Request' do
  it 'can create a roadtrip', :vcr do
    user = User.create!(email: 'pleasework@gmail.com', password: 'password123', password_confirmation: 'password123', api_key: 'raahahfpmmvtcvhzlztulkqwjcuernyjjbzwzzisqrdovaxfrz')

    roadtrip_params = {
      origin: "Denver, CO",
      destination: "Pueblo, CO",
      api_key: "raahahfpmmvtcvhzlztulkqwjcuernyjjbzwzzisqrdovaxfrz"
    }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(roadtrip_params)
    road_trip = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(road_trip[:data][:attributes][:start_city]).to eq("Denver, CO")
    expect(road_trip[:data][:attributes][:end_city]).to eq("Pueblo, CO")
    expect(road_trip[:data][:attributes][:travel_time]).to eq("01:45:23")
    expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to eq(48.2)
    expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to eq("few clouds")
  end

  it 'returns an error if invalid api_key', :vcr do
    user = User.create!(email: 'pleasework@gmail.com', password: 'password123', password_confirmation: 'password123', api_key: 'raahahfpmmvtcvhzlztulkqwjcuernyjjbzwzzisqrdovaxfrz')

    roadtrip_params = {
      origin: "Denver, CO",
      destination: "Pueblo, CO",
      api_key: "randomapikeyguess"
    }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(roadtrip_params)

    expect(response.status).to eq(401)
    expect(response.body).to eq("Please enter valid credentials")
  end

  it 'returns an error if no route is available', :vcr do
    user = User.create!(email: 'pleasework@gmail.com', password: 'password123', password_confirmation: 'password123', api_key: 'raahahfpmmvtcvhzlztulkqwjcuernyjjbzwzzisqrdovaxfrz')

    roadtrip_params = {
      origin: "Denver, CO",
      destination: "London, UK",
      api_key: "raahahfpmmvtcvhzlztulkqwjcuernyjjbzwzzisqrdovaxfrz"
    }
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(roadtrip_params)
  end
end
