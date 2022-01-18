require 'rails_helper'

RSpec.describe 'Roadtrip Request' do
  it 'can create a roadtrip', :vcr do
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
    expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to eq(51.67)
    expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).to eq("few clouds")
  end
end
