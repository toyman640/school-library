# A class representing a book with certain attributes and methods.
class Book
  attr_accessor :title
  attr_accessor :author
  attr_accessor :rental
  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end
  
  def add_rental(rental)
    @rental << rental
  end
end