require_relative '../book'

describe Book do
  context 'It should create a book' do
    book = Book.new('The Lord of The Rings', 'Tolkien')
    it 'should create a new book' do
      expect(book.title).to eq 'The Lord of The Rings'
      expect(book.author).to eq 'Tolkien'
    end
  end
end
