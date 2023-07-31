# frozen_string_literal: true

require 'person'

# A class inheriting person object with addition of classroom instance
class Student < Person
  # Inheriting person object.
  def initialize(id, age, classroom, _name = 'Unknown', parent_permission: true)
    super(name, parent_permission, id, age)
    @classroom = classroom
  end

  def play_hooky
    puts "¯\(ツ)/¯"
  end
end
