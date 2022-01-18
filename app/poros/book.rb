class Book
  attr_reader :isbn,
              :title,
              :publisher

  def initialize(data)
    @isbn = data[:isbn].first
    @title = data[:title]
    @publisher = data[:publisher]
  end
end
