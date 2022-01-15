require "rails_helper"

RSpec.describe Place do
  before :each do
    @place = Place.new(lat: 39.738453, lng: -104.984853)
  end

  it 'exists' do
    expect(@place).to be_an_instance_of Place
  end

  it 'has readable attributes' do
    expect(@place.lat).to eq(39.738453)
    expect(@place.lng).to eq(-104.984853)
  end
end
