require 'person'

# A class inheriting person object with addition of specialization instance
class Teacher < Person
  # Inheriting person object.
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_service
    true
  end
end
