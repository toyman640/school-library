require_relative 'app'

def main
  app = App.new
  puts 'Welcome to the Library App!'

  menu_options = {
    1 => app.method(:list_all_books),
    2 => app.method(:list_all_people),
    3 => app.method(:create_person),
    4 => app.method(:create_book),
    5 => app.method(:create_rental),
    6 => app.method(:list_rentals_for_person),
    7 => method(:exit_app)
  }

  loop do
    show_menu
    choice = gets.chomp.to_i

    if menu_options.key?(choice)
      menu_options[choice].call
    else
      show_invalid_choice
    end
  end
end

def show_menu
  puts "\nPlease choose an option:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a given person id'
  puts '7.  Exit'
end

def show_invalid_choice
  puts 'Invalid choice. Please try again.'
end

def exit_app
  puts 'Exiting the app. Goodbye!'
  exit
end


main
