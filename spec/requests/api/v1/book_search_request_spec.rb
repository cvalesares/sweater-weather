require 'rails_helper'

RSpec.describe "Book Search Request" do
  it 'gets a list of books', :vcr do
    location = "denver"
    quantity = 5
    
    get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"
    expect(response).to be_successful
  end
end
