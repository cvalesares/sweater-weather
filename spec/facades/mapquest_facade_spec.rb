require 'rails_helper'

RSpec.describe MapquestFacade do
  it 'can create an address object from json' do
    place = MapquestFacade.place("Denver,Co")

    expect(place.first).to be_an_instance_of Place
  end
end
