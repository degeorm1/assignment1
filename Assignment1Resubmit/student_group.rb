require_relative 'student.rb'
require_relative 'student_sorter.rb'

class StudentGroup
  attr_accessor :students_array, :target_size, :group_number, :criteria

  def initialize(target_size:, group_number:, criteria: nil)
    @target_size = target_size
    @group_number = group_number
    @students_array = []
    @criteria = criteria
  end

  def add_student?(student)
    current_size < target_size && meets_criteria?(student)
  end

  def add_overflow_student?
    current_size < (target_size + 1)
  end

  def add_student(student)
    self.students_array << student
  end

  def current_size
    @students_array.size
  end

  def each(&block)
    @students_array.each(&block)
  end

  def meets_criteria?(student)
    case criteria
    when 'same_major' 
      students_array.all? { |other_student| same_major?(student, other_student) }
    when 'same_section'
      students_array.all? { |other_student| same_section?(student, other_student) }
    end
  end

  def same_major?(student, other_student)
    ([student.major1, student.major2].compact & [other_student.major1, other_student.major2].compact).size.positive?
  end

  def same_section?(student, other_student)
    student.section == other_student.section
  end
end