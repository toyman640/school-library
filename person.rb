# frozen_string_literal: true

# A class representing a person with certain attributes and methods.
class Person
  # Initializes a new Person object.
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def of_age(age)
    age > 18
  end

  def can_use_service(age)
    of_age(age)
  end
end
