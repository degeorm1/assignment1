require_relative 'student_group.rb'
require_relative 'student_sorter.rb'
require_relative 'student.rb'
require_relative 'student_list.rb'
require_relative 'students_printer.rb'

class UserSession
  attr_accessor :list 
  
  def initialize(list)
    @list = list
  end

  def introduction
    puts "What would you like to do next? (A) Edit Student List  OR (B) Group and Print Student List"
    response = gets.chomp
    case response 
    when 'A' 
      edit_student_list
    when 'B' 
      group_students
    else 
      puts "Please choose a response of A or B" 
      introduction 
    end
  end

  def edit_student_list(response = 'edit')
    while response != 'D' 
    puts "What would you like to do? (A) edit a student (B) delete a student (C) add a new student (D) Exit to Proceed with Grouping Students"
    response = gets.chomp
      case response 
      when 'A'
        ## prompt to find student by id, or name
        student = find_student 
        edit_student(student, 'Y')
      when 'B'
        student = find_student 
        idx = list.students.index(student)
        list.students.delete_at(idx)
        edit_student_list
      when 'C' 
        student = create_student
        student.print_self
        edit_student_list
      when 'D'
        group_students
        break;
      else
        puts "Invalid Response"
        edit_student_list
      end
    end
  end

  def edit_student(student, response)
   while response != 'N'
   puts student.print_self
   puts "Enter the attribute you would like to change (e.g. email)"
      attribute = gets.chomp
      if student.respond_to?("#{attribute}=")
        puts "Enter the new value of #{attribute}"
        value = gets.chomp
        student.send("#{attribute}=", value)

        puts "would you like to change any other attribute of the student? (Y/N)"
        response = gets.chomp
        edit_student(student, response)
      else 
        puts "please enter a valid attribute to edit"
        edit_student(student, 'Y')
      end   
    end
  end

  def group_students
    puts "How would you like to sort the students (A) by number of groups or (B) by number of students per group."

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
    
    puts "How would you like to sort the students (A) by Major or (B) by section?"
    teacher_response = gets.chomp
    teacher_response.upcase!
    criteria = nil
    if teacher_response == "A"
      criteria = "same_major"
    elsif teacher_response == "B"
      criteria = "same_section"
    end

    puts "Enter the name of the output file"
    output_file_name = gets.chomp
    
    sorter = StudentSorter.new(students: list.students, group_size: num_of_students,     
                               number_of_groups: num_of_groups, criteria: criteria)
    sorter.group_split # split students into groups, instantiating student groups
    printer = StudentsPrinter.new(sorter.groups)
    printer.print_to_console
    printer.print_to_file(output_file_name)
  end

  def find_student
    puts "Would you like to search by (A)id or by (B)last_name and first_name?"
    response = gets.chomp
    if response == 'A'
      puts "enter the student id"
      id = gets.chomp
      student = list.find_by_id(id.to_i)
      if student.nil?
        puts "Student not found. Please try again"
        find_student
      end
      student.print_self
      student
    elsif response == 'B'
      puts "enter student last_name and first_name (e.g. 'Danielson,Thompson')"
      name = gets.chomp
      last_name = name.split(',')[0]
      first_name = name.split(',')[1]
      student = list.find_by_names(last_name, first_name)
      if student.nil?
        puts "Student not found. Please try again"
        find_student
      end
      student.print_self
      student
    else 
      puts "Invalid Response"
      find_student
    end
  end

  def create_student
    puts "Please enter the student's last_name"
    last_name = gets.chomp
    puts "Please enter the student's first_name"
    first_name=gets.chomp
    puts"Please enter the student's email"
    email = gets.chomp
    puts "Please enter the student's first major"
    major1 = gets.chomp
    puts "Please enter the student's second major, if there is no secondary major type NA"
    major2=gets.chomp
    puts "Please enter the student's first minor, if there is no first minor type NA"
    minor1=gets.chomp
    puts "Please enter the student's second minor, if there is no secondary minor type NA"
    minor2=gets.chomp
    puts "Please enter the student's section."
    section=gets.chomp
    ####
    id = list.size + 1
    student = Student.new(id, first_name, last_name, email, major1, major2, minor1, minor2, section)
    list.add_student(student)
    student
  end
end 