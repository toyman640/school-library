require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'student'

class App
  attr_accessor :books, :people, :rentals, :teacher, :classroom, :student

  def initialize
    @books = []
    @people = []
    @rentals = []
    @teacher = []
    @classroom = []
    @student = []
  end

  def list_all_books
    puts 'List of all books:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'List of all people:'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.type}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    parent_permission = choice == 1 ? parent_permission_get : true
    classroom = nil unless choice == 1 && parent_permission

    person = choice == 1 ? create_student(age, name, parent_permission, classroom) : create_teacher(age, name)

    if person
      @people << person
      puts 'Person created successfully'
    else
      puts 'Invalid choice. Please enter 1 for student or 2 for teacher.'
    end
  end

  def create_student(age, name, parent_permission, classroom)
    student = Student.new(age, classroom, name: name, parent_permission: parent_permission)
    student.type = 'Student'
    student
  end

  def create_teacher(age, name)
    print 'Enter Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name: name, parent_permission: true)
    teacher.type = 'Teacher'
    teacher
  end

  def parent_permission_get
    loop do
      print 'Has parent permission? [Y/N]:'
      parent_permission_input = gets.chomp.downcase
      return parent_permission_input == 'y' if %w[y n].include?(parent_permission_input)

      puts "Invalid input. Please enter 'Y' or 'N' only."
    end
  end

  # def classroom_get
  #   puts 'Enter classroom label:'
  #   Classroom.new(gets.chomp)
  # end

  def create_book
    print 'Title:'
    title = gets.chomp

    print 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully.'
  end

  # def create_rental
  #   # List all available books
  #   print 'Available books:'
  #   list_all_books

  #   print 'Select the index of the book from the available books:'
  #   book_index = gets.chomp.to_i

  #   # List all persons
  #   puts 'List of all persons:'
  #   list_all_people

  #   print "Select a person from the following list:"
  #   person_id = gets.chomp.to_i

  #   print 'Enter rental date (YYYY-MM-DD):'
  #   date = gets.chomp

  #   # Find the person by their ID
  #   person = @people.find { |p| p.id == person_id }

  #   if person && book_index.between?(0, @books.length - 1)
  #     book = @books[book_index]

  #     rental = Rental.new(date, book, person)
  #     @rentals << rental
  #     puts " Book ID: #{rental.book.object_id}, Person ID: #{rental.person.object_id}, Rental Date: #{rental.date}."
  #   else
  #     puts 'Invalid person ID or book selection. Please check the ID and book index and try again.'
  #   end
  # end

  def create_rental
    # List all available books
    print 'Available books:'
    list_all_books

    print 'Select the index of the book from the available books:'
    book_index = gets.chomp.to_i

    # List all persons
    puts 'List of all persons:'
    list_all_people

    print 'Select a person by index from the following list:'
    person_index = gets.chomp.to_i

    print 'Enter rental date (YYYY-MM-DD):'
    date = gets.chomp

    # Find the person by their index
    person = @people[person_index]

    if person && book_index.between?(0, @books.length - 1)
      book = @books[book_index]

      rental = Rental.new(date, book, person)
      @rentals << rental
      puts " Book ID: #{rental.book.object_id}, Person ID: #{rental.person.object_id}, Rental Date: #{rental.date}."
    else
      puts 'Invalid person index or book selection. Please check the index and book index and try again.'
    end
  end

  def list_rentals_for_person
    print 'Enter person ID to list rentals:'
    person_id = gets.chomp.to_i

    person_rentals = @rentals.select { |rental| rental.person.id == person_id }
    if person_rentals.empty?
      puts "No rentals found for Person ID #{person_id}."
    else
      puts "List of rentals for Person ID #{person_id}:"
      person_rentals.each do |rental|
        puts "Rental ID: #{rental.object_id}, Book ID: #{rental.book.object_id}, Rental Date: #{rental.date}"
      end
    end
  end
end
