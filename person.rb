# A class representing a person with certain attributes and methods.
class Person
  # Initializes a new Person object.
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand 1..1000
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_service
    @age >= 18 || @parent_permission
  end

  private

  def of_age
    @age >= 18
  end
end
