# A class representing a rental with certain attributes and methods.
class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end
end
