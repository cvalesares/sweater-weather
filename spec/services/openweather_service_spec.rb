require 'rails_helper'

RSpec.describe OpenweatherService do
  it 'creates a faraday connection' do
    expect(OpenweatherService.conn).to be_a Faraday::Connection
  end

  it 'parses JSON data into a hash' do
    weather = OpenweatherService.weather(39.738453, -104.984853)

    expect(weather).to be_a Hash
    expect(weather).to have_key :hourly
  end
end
