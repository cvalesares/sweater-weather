require 'rails_helper'

RSpec.describe 'Backgrounds Request' do
  it 'gets background photos', :vcr do
    location = "Denver,Co"
    get "/api/v1/backgrounds?location=#{location}"
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    photo = parsed[:data][:attributes]

    expect(photo[:image]).to have_key(:location)
    expect(photo[:image][:location]).to eq("Denver Colorado")
    expect(photo[:image]).to have_key(:image_url)
    expect(photo[:image][:image_url]).to eq("https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTE2OTd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDb3xlbnwwfHx8fDE2NDIzNjEwNTI&ixlib=rb-1.2.1")
    expect(photo[:image]).to have_key(:author)
    expect(photo[:image][:author]).to eq("Dillon Wanner on Upsplash")
    expect(photo[:image]).to have_key(:logo)
    expect(photo[:image][:logo]).to eq("https://images.unsplash.com/profile-1616266477156-e4cd50197e4dimage?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32")
    expect(photo[:image]).to have_key(:download)
    expect(photo[:image][:download]).to eq("https://unsplash.com/photos/mvtrRdFDzzI/download?ixid=MnwyOTE2OTd8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDb3xlbnwwfHx8fDE2NDIzNjEwNTI")

  end
end
