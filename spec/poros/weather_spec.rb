require 'rails_helper'

RSpec.describe Weather do
  before :each do
    @current_weather = OpenweatherFacade.current_weather(39.738453, -104.984853)
  end

  describe 'current weather' do
    it 'exists', :vcr do
      expect(@current_weather).to be_an_instance_of Weather
    end

    it 'has readable attributes', :vcr do
      #these times need to be parsed and formated
      expect(@current_weather.date_time).to eq(1642274358)
      expect(@current_weather.sunrise).to eq(1642256344)
      expect(@current_weather.sunset).to eq(1642291158)
      expect(@current_weather.temp).to eq(278.17)
      expect(@current_weather.feels_like).to eq(277.34)
      expect(@current_weather.humidity).to eq(44)
      expect(@current_weather.uvi).to eq(2.21)
      expect(@current_weather.visibility).to eq(10000)
      expect(@current_weather.conditions).to eq("clear sky")
      expect(@current_weather.icon).to eq("01d")
    end
  end
end
