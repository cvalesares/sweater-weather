require 'rails_helper'

RSpec.describe BackgroundPhoto do
  before :each do
    @photo = UnsplashFacade.photo("Denver").first
  end

  it 'exists', :vcr do
    expect(@photo).to be_an_instance_of BackgroundPhoto
  end

  it 'has readable attributes', :vcr do
    expect(@photo.author).to eq("Andrew Coop on Upsplash")
    expect(@photo.download).to eq("https://unsplash.com/photos/NflJmUuaYVI/download?ixid=MnwyOTE2OTd8MHwxfHNlYXJjaHwxfHxEZW52ZXJ8ZW58MHx8fHwxNjQyMzU2MjA3")
    expect(@photo.image_url).to eq("https://images.unsplash.com/photo-1602800458591-eddda28a498b?ixid=MnwyOTE2OTd8MHwxfHNlYXJjaHwxfHxEZW52ZXJ8ZW58MHx8fHwxNjQyMzU2MjA3&ixlib=rb-1.2.1")
    expect(@photo.location).to eq("Aurora, CO, USA")
    expect(@photo.logo).to eq("https://images.unsplash.com/profile-1623106766393-2f16aecfe7b9image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32")
  end
end
