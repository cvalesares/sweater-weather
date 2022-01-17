require 'rails_helper'

RSpec.describe Route do
  before :each do
    @route = MapquestFacade.route("New York, NY", "Los Angeles, CA")
  end

  it 'exists', :vcr do
    expect(@route).to be_an_instance_of Route
  end

  it 'has readable attributes', :vcr do
    expect(@route.start_city).to eq("New York, NY")
    expect(@route.end_city).to eq("Los Angeles, CA")
    expect(@route.travel_time).to eq("40:16:00")
  end
end
