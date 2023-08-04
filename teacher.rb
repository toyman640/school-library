require_relative 'person'

# A class inheriting person object with addition of specialization instance
class Teacher < Person
  # Inheriting person object.
  def initialize(specialization, age, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end
