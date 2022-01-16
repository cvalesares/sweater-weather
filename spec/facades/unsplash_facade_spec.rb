require 'rails_helper'

RSpec.describe UnsplashFacade do
  it 'can find a photo', :vcr do
    photo = UnsplashFacade.photo("Denver")

    expect(photo.first).to be_an_instance_of BackgroundPhoto
  end
end
