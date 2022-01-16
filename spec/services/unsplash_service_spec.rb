require 'rails_helper'

RSpec.describe UnsplashService do
  it 'creates a faraday connection' do
    expect(UnsplashService.conn).to be_a Faraday::Connection
  end

  it 'parses JSON data into a hash', :vcr do
    photo = UnsplashService.photo("Denver")

    expect(photo).to be_a Hash
    expect(photo).to have_key :results
  end
end
