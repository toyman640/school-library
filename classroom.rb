# A class representing a classroom with certain attributes and methods.
class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
  end

  attr_reader :students

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
