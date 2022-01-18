require 'rails_helper'

RSpec.describe OpenlibraryFacade do
  it 'can create a book object from json', :vcr do
    books = OpenlibraryFacade.books("Denver", 5)

    expect(books.first).to be_an_instance_of Book
  end
end
