require 'rails_helper'

RSpec.describe Weather do
  before :each do
    @current_weather = OpenweatherFacade.current_weather(39.738453, -104.984853)
  end

  describe 'current weather' do
    it 'exists' do
      expect(@current_weather).to be_an_instance_of Weather
    end

    it 'has readable attributes' do
      #these times need to be parsed and formated (may also need vcr for testing)
      # expect(@current_weather.date_time).to eq(Time.now)
      expect(@current_weather.sunrise).to eq(1642256344)
      expect(@current_weather.sunset).to eq(1642291158)
      expect(@current_weather.temp).to eq(276.69)
      expect(@current_weather.feels_like).to eq(276.69)
      expect(@current_weather.humidity).to eq(45)
      expect(@current_weather.uvi).to eq(2.21)
      expect(@current_weather.visibility).to eq(10000)
      expect(@current_weather.conditions).to eq("clear sky")
      expect(@current_weather.icon).to eq("01d")
    end
  end
end
