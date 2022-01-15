require 'rails_helper'

RSpec.describe HourlyWeather do
  before :each do
    @hourly_weather = OpenweatherFacade.hourly_weather(39.738453, -104.984853)
  end

  describe 'hourly weather' do
    it 'exists', :vcr do
      expect(@hourly_weather.first).to be_an_instance_of(HourlyWeather)
    end

    it 'has readable attributes', :vcr do
      expect(@hourly_weather.first.time).to eq("16:00:00")
      expect(@hourly_weather.first.temp).to eq(45.7)
      expect(@hourly_weather.first.conditions).to eq("clear sky")
      expect(@hourly_weather.first.icon).to eq("01d")
    end
  end
end
