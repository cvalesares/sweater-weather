require 'rails_helper'

RSpec.describe OpenlibraryService do
  it 'creates a faraday connection' do
    expect(OpenlibraryService.conn).to be_a Faraday::Connection
  end

  it 'can find books by search params', :vcr do
    books = OpenlibraryService.books("Denver", 5)

    expect(books).to be_a Hash
    expect(books).to have_key :docs
  end
end
