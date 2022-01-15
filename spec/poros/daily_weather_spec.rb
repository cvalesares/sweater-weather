require 'rails_helper'

RSpec.describe DailyWeather do
  before :each do
    @daily_weather = OpenweatherFacade.daily_weather(39.738453, -104.984853)
  end

  describe 'daily weather' do
    it 'exists', :vcr do
      expect(@daily_weather.first).to be_an_instance_of(DailyWeather)
    end

    it 'has readable attributes', :vcr do
      expect(@daily_weather.first.date).to eq(1642273200)
      expect(@daily_weather.first.sunrise).to eq(1642256344)
      expect(@daily_weather.first.sunset).to eq(1642291158)
      expect(@daily_weather.first.max_temp).to eq(46.99)
      expect(@daily_weather.first.min_temp).to eq(25.16)
      expect(@daily_weather.first.conditions).to eq("clear sky")
      expect(@daily_weather.first.icon).to eq("01d")
    end
  end
end
