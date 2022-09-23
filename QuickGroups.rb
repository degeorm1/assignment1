=begin
Michael De George
code For CSC415
9/22/22
=end

#requries csv file name and sort.rb file name 
require "csv"
require_relative'sort.rb'

#ask user first question to input file name and takes user input
puts"Enter the input file"
input = gets.chomp

#asks user second question to input file name and takes user input 
puts "Enter the output file"
output=gets.chomp

#reads and opens input and output file respectivley 
CSV.read(input)
CSV.open(output)

#takes file and reads input, creaters header from input file and moves over a colum by reading a space and stepping also takes number of students and counts them  
info=CSV.parse(File.read(input),headers: true, col_sep: " ") 
num_students = info.size

#creates a structure, taking from header
Student = Struct.new(:first_name, :last_name, :email, :major1, :major2, :minor1, :minor2, :section) 

#creates print statements for stduent info, also creates if statements if minor or major is nil and not needed  
def studInfo (student)
   
    puts "Full Name:#{student.first_name}  #{student.last_name}" 
    puts"Email: #{student.email}"
    puts "Major or Majors: #{student.major1}"

            if student.major2 !=nil
            puts " #{student.major2}"
            end
        if student.minor1 != nil
        puts "Minor or Minors: #{student.minor1}"
        end
            if student.minor2 != nil
        puts " and #{student.minor2}"
            end
        puts "Section: #{student.section}"
end


#created an array for the student info 
array_for_the_info = [Student.new]
j=0

#temporary values for the stduent info that will be modified and stored in the array 
while j < num_students
    tempStudent = Student.new(info[j]["first_name"], info[j]["last_name"], info[j]["email"], info[j]["major1"], info[j]["major2"], info[j]["minor1"], info[j]["minor2"], info[j]["section"])
    array_for_the_info << tempStudent
    j+=1
end

#asks how the user wants to sort the students and takes the user response 
puts "How do you want to sort the students? By number of groups-(A) OR By number of students per group?-(B)"
instructor_response=gets.chomp
instructor_response.upcase!
valid_input = false
while valid_input == false
    
        if instructor_response == "A"
            puts "How many number of groups?"
            num_groups = gets.chomp.to_i
            num_stud_group = num_students / num_groups
            valid_input = true
            elsif instructor_response == "B"
            puts "How many students per group?"
            num_stud_group = gets.chomp.to_i
            num_groups = num_students / num_stud_group
            valid_input = true
        else
            puts "Failure Invalid Input"
           
        end
end

#if statements take the users info and find the number of students divided by the number of groups also has a else if statement if the user chose as their response B 

#tests to see if the array is correct and prints 
m = 1
while m < num_students
    puts studInfo(array_for_the_info[m])
    m+=1
end
n=0
out_file = File.new('Output.csv','w')
    out_file << array_for_the_info
out_file.close

#creates an output file for the main file QuickGroups 
