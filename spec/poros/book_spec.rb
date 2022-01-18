require 'rails_helper'

RSpec.describe Book do
  before :each do
    @book = OpenlibraryFacade.books("Denver", 5)
  end

  it 'exists', :vcr do
    expect(@book.first).to be_an_instance_of Book
  end

  it 'has readable attributes', :vcr do
    expect(@book.first.isbn).to eq(["0517215039", "9780517623619", "9780517215036", "0517623617"])
    expect(@book.first.title).to eq("Denver")
    expect(@book.first.publisher).to eq(["Crescent Books", "Random House Value Publishing", "Distributed by Crown Publishers", "Crescent"])
  end
end
