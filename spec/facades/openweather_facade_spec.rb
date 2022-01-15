require 'rails_helper'

RSpec.describe OpenweatherFacade do
  it 'it can find current_weather' do
    weather = OpenweatherFacade.current_weather(39.738453, -104.984853)

    expect(weather).to be_an_instance_of Weather
  end
end
