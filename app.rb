require_relative './prompts'

require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './preserve_data'
require 'colorize'

class App
  include Prompts
  include PreserveData

  def initialize()
    @people = load_people
    @books = load_books
    @rentals = load_rentals
  end

  def list_objects(input)
    case input
    when 1
      list_books
    when 2
      list_people
    when 6
      list_rentals
    end
  end

  def create_object(input)
    case input
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    end
  end

  # 1 - List all books
  def list_books
    puts(@books.map { |b| "Title: #{b.title}, Author: #{b.author}" })
    sleep 0.75
  end

  # 2 - List all people
  def list_people
    puts(@people.map { |p| "[#{p.class.name}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" })
    sleep 0.75
  end

  # 3 - Create a person
  def create_person
    selection = one_line_prompt('Do you want to create a student (1) or a teacher (2)? [input the number]: ').to_i

    age = one_line_prompt('Age: ').to_i
    name = one_line_prompt('Name: ')

    case selection
    when 1
      input = one_line_prompt('Has parent permission? [Y/N]: ')
      permission = %w[Y y Yes yes].include?(input)
      student = Student.new(age: age, name: name, parent_permission: permission, classroom: @classroom)
      @people.push(student)
    when 2
      specialization = one_line_prompt('Specialization: ')
      teacher = Teacher.new(age: age, name: name, specialization: specialization)
      @people.push(teacher)
    end
  end

  # 4 - Create a book
  def create_book
    title = one_line_prompt('Title: ')
    author = one_line_prompt('Author: ')
    @books.push(Book.new(title, author))
  end

  # 5 - Create a rental
  def create_rental
    puts 'Select a book from the following list by number'
    puts(@books.each_with_index.map { |b, i| "#{i}) Title: #{b.title}, Author: #{b.author}" })
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    puts(@people.each_with_index.map { |p, i| "#{i}) [#{p.class.name}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}" })
    person_index = gets.chomp.to_i

    date = one_line_prompt('Date: ')
    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
  end

  # 6 - List rentals
  def list_rentals
    id = one_line_prompt('ID of person: ').to_i
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    sleep 0.75
  end

  def run
    puts 'Welcome to School Library App'.yellow
    loop do
      input = main_prompt
      list_objects(input) if [1, 2, 6].include?(input)
      create_object(input) if [3, 4, 5].include?(input)
      break if input == 7
    end
    save_book
    save_people
    save_rental
  end
end
