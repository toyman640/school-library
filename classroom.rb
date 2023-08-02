# A class representing a classroom with certain attributes and methods.
class Classroom
  has_many :students
  def initialize(label)
    @label = label
  end

  attr_accessor :label
end
