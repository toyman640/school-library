# frozen_string_literal: true

require 'person'

# A class inheriting person object with addition of specialization instance
class Teacher < Person
  # Inheriting person object.
  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super(name, parent_permission, id, age)
    @specialization = specialization
  end

  def can_use_service
    puts true
  end
end
