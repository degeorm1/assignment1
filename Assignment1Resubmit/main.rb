require 'csv'
require_relative 'student.rb'
require_relative 'student_sorter.rb'
require_relative 'students_printer.rb'
require_relative 'user_session.rb'
require_relative 'student_list.rb'

puts "Please enter file name of the student csv you want to use"
file_name = gets.chomp

#makes sure the file exists 
while !(File.file?(file_name))
  print "Invalid file name: this files does not exist in the directory\nPlease try again.\n"
  print "\nPlease enter in the name of the input file (csv): "
  file_name = gets.chomp
end


#### show initial list of students, get user input if they want to edit/add/delete students 
list = StudentList.new
list.parse_list(file_name)

puts "here is your current list of students:"
list.print_list

session = UserSession.new(list)
session.introduction