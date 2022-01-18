require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'can create an address object from json', :vcr do
    place = MapquestFacade.place("Denver,Co")

    expect(place.first).to be_an_instance_of Place
  end

  it 'can create a route object from json', :vcr do
    route = MapquestFacade.road_trip("New York, NY", "Los Angeles, CA")

    expect(route).to be_an_instance_of RoadTrip
  end

  #maybe add more sad path testing here for invalid route
end
