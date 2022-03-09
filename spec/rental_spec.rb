require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Rental do
  context 'When providing a book and a person' do
    book = Book.new('LOTR', 'Tolkien')
    person = Person.new(id: 123, age: 40, name: 'Kevin')
    rental = Rental.new('09/03/2022', book, person)

    it 'should create a rental for person' do
      expect(person.rentals).to include(rental)
    end

    it 'should create a rental for book' do
      expect(book.rentals).to include(rental)
    end
  end
end
