require_relative 'student.rb'
require_relative 'student_group.rb'

class StudentSorter
  attr_accessor :students, :groups, :number_of_groups, :group_size, :criteria
  
  def initialize(students:, group_size: nil, number_of_groups: nil, criteria: nil)
    @students = students
    @group_size = group_size 
    @number_of_groups = number_of_groups
    @groups = []
    @criteria = criteria
  end

  def group_split
    if group_size
      group_nums = number_of_grps(group_size)
      group(group_nums, group_size)
    else
      grp_size = grp_size(number_of_groups)
      group(number_of_groups, grp_size)
    end
  end

  def group(number_of_groups, students_per_group)
    number_of_groups.times do |i|
      self.groups << StudentGroup.new(target_size: students_per_group, group_number: i+1, criteria: criteria)
    end
    students.each do |student|
      group = groups.find { |group| group.add_student?(student) } # find the first group that meets criteria, or return nil
      if group.nil?
        group = groups.find { |group| group.add_overflow_student? }
        group.add_student(student)
      else
        group.add_student(student)
      end
      # what group does the student go
    end
  end

  def number_of_grps(students_per_group)
    (student_size.to_f / students_per_group).ceil
  end

  def grp_size(number_of_groups) 
    (student_size.to_f / number_of_groups).ceil
  end

  def group_by
  end

  def student_size 
    @student_size ||= students.size 
  end
end

# 50 students 
# 5 groups => 10 students per group 

# 50 students 
# 7 students per group 
# 7 groups