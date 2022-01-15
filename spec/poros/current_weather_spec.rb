require 'rails_helper'

RSpec.describe CurrentWeather do
  before :each do
    @current_weather = OpenweatherFacade.current_weather(39.738453, -104.984853)
  end

  describe 'current weather' do
    it 'exists', :vcr do
      expect(@current_weather).to be_an_instance_of CurrentWeather
    end

    it 'has readable attributes', :vcr do
      #these times need to be parsed and formated
      expect(@current_weather.date_time).to eq("Sat, 15 Jan 2022 16:36:23.000000000 -0500")
      expect(@current_weather.sunrise).to eq("Sat, 15 Jan 2022 09:19:04.000000000 -0500")
      expect(@current_weather.sunset).to eq("Sat, 15 Jan 2022 18:59:18.000000000 -0500")
      expect(@current_weather.temp).to eq(47.05)
      expect(@current_weather.feels_like).to eq(47.05)
      expect(@current_weather.humidity).to eq(44)
      expect(@current_weather.uvi).to eq(0.64)
      expect(@current_weather.visibility).to eq(10000)
      expect(@current_weather.conditions).to eq("clear sky")
      expect(@current_weather.icon).to eq("01d")
    end
  end
end
