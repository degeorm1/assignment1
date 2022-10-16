require 'csv'
require_relative 'student.rb'
require_relative 'student_sorter.rb'
require_relative 'students_printer.rb'

puts "Please enter file name of the student csv you want to use"
file_name = gets.chomp

#makes sure the file exists 
while !(File.file?(@infile))
    print "Invalid file name: this files does not exist in the directory\nPlease try again.\n"
    print "\nPlease enter in the name of the input file (csv): "
    @infile = gets.chomp
end

puts "How would you like to sort the students (A)- by number of groups or (B)- by number of students per group."

instructor_response = gets.chomp
instructor_response.upcase!
num_of_groups = nil 
num_of_students = nil
if instructor_response == "A"
  puts "How many number of groups?"
  num_of_groups = gets.chomp.to_i
elsif instructor_response == "B"
  puts "How many number of students?"
  num_of_students = gets.chomp.to_i
end 

puts "How would you like to sort the students (A) - by Major or (B)- by section?"
teacher_response = gets.chomp
teacher_response.upcase!
criteria = nil
if teacher_response = "A"
  criteria = "same_major"
elsif teacher_response = "B"
  criteria = "same_section"
end

puts "Enter the name of the output file"
output_file_name = gets.chomp

arr = CSV.read(file_name) # parse CSV file

# [["first_name", "last_name"], ["jack", "simpson"]]

arr.slice(1..-1).each_with_object(students = []) do |student, students|
  students << Student.new(*student) # make a student object for each row except the first
end

## take user input
#criteria, group size, students 
sorter = StudentSorter.new(students: students, group_size: num_of_students, number_of_groups: num_of_groups, criteria: criteria) # instantiate a sorter with students
sorter.group_split # split students into groups, instantiating student groups
printer = StudentsPrinter.new(sorter.groups)
printer.print_to_console
printer.print_to_file(output_file_name)
### make output file

### display student groups

# group first_name, last_name, major, minor, etc.
# 1       "jack"      "simpson"
# 1
#
### sorted by group number
