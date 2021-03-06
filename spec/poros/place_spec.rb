require "rails_helper"

RSpec.describe Place do
  before :each do
    @facade = MapquestFacade.place("Denver,Co")
    @place = @facade.first

  end

  it 'exists', :vcr do
    expect(@place).to be_an_instance_of Place
  end

  it 'has readable attributes', :vcr do
    expect(@place.lat).to eq(39.738453)
    expect(@place.lng).to eq(-104.984853)
  end
end
