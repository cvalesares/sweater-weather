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
      expect(@daily_weather.first.date).to eq("2022-01-15")
      expect(@daily_weather.first.sunrise).to eq("Sat, 15 Jan 2022 09:19:04.000000000 -0500")
      expect(@daily_weather.first.sunset).to eq("Sat, 15 Jan 2022 18:59:18.000000000 -0500")
      expect(@daily_weather.first.max_temp).to eq(46.99)
      expect(@daily_weather.first.min_temp).to eq(25.16)
      expect(@daily_weather.first.conditions).to eq("clear sky")
      expect(@daily_weather.first.icon).to eq("01d")
    end
  end
end
