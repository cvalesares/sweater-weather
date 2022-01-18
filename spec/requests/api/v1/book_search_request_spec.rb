require 'rails_helper'

RSpec.describe "Book Search Request" do
  it 'gets a list of books', :vcr do
    location = "denver"
    quantity = 5

    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    results = parsed[:data][:attributes]

    expect(results[:destination]).to eq(location)
    expect(results[:forecast][:summary]).to eq("overcast clouds")
    expect(results[:forecast][:temperature]).to eq(43.72)
    expect(results[:total_books_found]).to eq(8480)
    expect(results[:books].count).to eq(quantity)
    expect(results[:books].first[:isbn]).to eq("0517215039")
    expect(results[:books].first[:title]).to eq("Denver")
    expect(results[:books].first[:publisher]).to eq(["Crescent Books", "Random House Value Publishing", "Distributed by Crown Publishers", "Crescent"])
  end
end
