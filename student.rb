require 'person'

# A class inheriting person object with addition of classroom instance
class Student < Person
  # Inheriting person object.
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
