module Prompts
  def main_prompt
    puts "
      Please choose an option by entering a number:
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person
      7 - Exit
    ".black.on_blue
    gets.chomp.to_i
  end

  def one_line_prompt(message)
    print message.blue
    gets.chomp
  end
end
