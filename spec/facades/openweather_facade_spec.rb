require 'rails_helper'

RSpec.describe OpenweatherFacade do
  it 'can find current weather', :vcr do
    weather = OpenweatherFacade.current_weather(39.738453, -104.984853)

    expect(weather).to be_an_instance_of CurrentWeather
  end

  it 'can find daily weather', :vcr do
    weather = OpenweatherFacade.daily_weather(39.738453, -104.984853)

    expect(weather.first).to be_an_instance_of DailyWeather
  end

  it 'can find hourly weather', :vcr do
    weather = OpenweatherFacade.hourly_weather(39.738453, -104.984853)

    expect(weather.first).to be_an_instance_of HourlyWeather
  end
end
