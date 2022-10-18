require 'csv'
require_relative 'student_group.rb'
require_relative 'student_sorter.rb'
require_relative 'student.rb'
require_relative 'user_session'

class StudentList
  attr_accessor :students 
  
  def initialize(students = [])
    @students = students 
  end

  def parse_list(file_name)
    arr = CSV.read(file_name) # parse CSV file

    arr.slice(1..-1).each_with_object([]).with_index(1) do |(student, students), idx|
      self.students << Student.new(idx, *student) # make a student object for each row except the first
    end
  end

  def print_list
    shape_data.each do |row|
      puts row.join(' || ')
    end
  end

  def shape_data
    students.each_with_object(output_rows) do |student, rows|
      row = [student.id, student.first_name, student.last_name, student.email,
        student.major1, student.major2, student.minor1, student.minor2,student.section]
      row.map! { |attribute| nilify(attribute) }
      rows << row
    end
  end

  def headers
    ["id", "first_name", "last_name", "email", "major1", "major2", "minor1", "minor2", "section"]
  end

  def output_rows
    [headers]
  end

  def nilify(attribute)
    attribute || "NA"
  end

  def find_by_id(id)
    students.find { |student| student.id == id }
  end

  def find_by_names(last_name, first_name)
    students.find { |student| student.last_name == last_name && student.first_name == first_name}
  end

  def size
    students.size
  end

  def add_student(student)
    students << student
  end
end