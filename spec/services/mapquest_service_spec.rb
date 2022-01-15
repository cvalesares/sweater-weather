require 'rails_helper'

RSpec.describe MapquestService do
  it 'creates a faraday connection' do
    expect(MapquestService.conn).to be_a Faraday::Connection
  end

  it 'parses JSON data into a hash' do
    address = MapquestService.place("Denver,Co")

    expect(address).to be_a Hash
    expect(address).to have_key :results
  end
end
