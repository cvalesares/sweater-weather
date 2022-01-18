require 'rails_helper'

RSpec.describe RoadTrip do
  before :each do
    @route = MapquestFacade.road_trip("New York, NY", "Los Angeles, CA")
  end

  it 'exists', :vcr do
    expect(@route).to be_an_instance_of RoadTrip
  end

  it 'has readable attributes', :vcr do
    expect(@route.start_city).to eq("New York, NY")
    expect(@route.end_city).to eq("Los Angeles, CA")
    expect(@route.travel_time).to eq("40:16:00")
    expect(@route.hourly_weather.count).to eq(48)
    expect(@route.hours_traveled).to eq("40")
  end
end
