# require_relative 'nameable'

class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# A class representing a person with certain attributes and methods.
class Person < Nameable
  attr_accessor :nameable, :name, :age

  # Initializes a new Person object.
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand 1..1000
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_reader :id

  def can_use_service
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end
end

class BaseDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  MAX_LENGTH = 10
  def correct_name
    name = @nameable.correct_name
    name.length > MAX_LENGTH ? name[0...MAX_LENGTH] : name
  end
end
