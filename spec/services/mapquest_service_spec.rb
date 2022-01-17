require 'rails_helper'

RSpec.describe MapquestService do
  it 'creates a faraday connection' do
    expect(MapquestService.conn).to be_a Faraday::Connection
  end

  it 'can find a location', :vcr do
    address = MapquestService.place("Denver,Co")

    expect(address).to be_a Hash
    expect(address).to have_key :results
  end

  it 'can find a route', :vcr do
    route = MapquestService.route("New York, NY", "Los Angeles, CA")

    expect(route).to be_a Hash
    expect(route).to have_key :route
  end

  #maybe add another it block for route sad path here
end
