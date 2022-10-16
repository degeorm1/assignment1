require_relative 'student.rb'
require_relative 'student_sorter.rb'
require_relative 'student_group.rb'

class StudentsPrinter
  attr_reader :student_groups
  
  def initialize(student_groups)
    @student_groups = student_groups
  end

  def print_to_console
    shape_data.each do |row|
      puts row.join(' || ')
    end
  end

  def print_to_file(file_name)
    CSV.open(file_name, 'w') do |csv|
      shape_data.each do |row|
        csv << row
      end
    end 
  end

  def shape_data
    student_groups.each_with_object(output_rows) do |group, rows|
      group.each do |student|
        row = [group.group_number, student.first_name, student.last_name, student.email, student.major1, student.major2, student.minor1, student.minor2,student.section]
        row.map! { |attribute| nilify(attribute) }
        rows << row
      end
    end
  end

  def headers
    ["group_number", "first_name", "last_name", "email", "major1", "major2", "minor1", "minor2", "section"]
  end

  def output_rows
    [headers]
  end

  def nilify(attribute)
    attribute || "NA"
  end
end
