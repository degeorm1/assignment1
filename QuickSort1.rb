=begin
Michael De George
code For CSC415
=end

require "csv"

puts"Enter the input file"
input = gets.chomp

puts "Enter the output file"
output=gets.chomp

CSV.read(input)
CSV.open(output)

info=CSV.parse(File.read(input),headers: true, col_sep: " ") 
num_students = info.size

Student = Struct.new(:first_name, :last_name, :email, :major1, :major2, :minor1, :minor2, :section) 

def studInfo (student)
   
    puts "Full Name:#{student.first_name}  #{student.last_name}" 
    puts"Email: #{student.email}"
    puts "Major or Majors: #{student.major1}"

            if student.major2 !=nil
            puts " #{student.major2}"
            end
        if student.minor1 != nil
        puts "Minor(s): #{student.minor1}"
        end
            if student.minor2 != nil
        puts " and #{student.minor2}"
            end
        puts "Section: #{student.section}"
end



array_for_the_info = [Student.new]
j=0

while j < num_students
    tempStudent = Student.new(info[j]["first_name"], info[j]["last_name"], info[j]["email"], info[j]["major1"], info[j]["major2"], info[j]["minor1"], info[j]["minor2"], info[j]["section"])
    array_for_the_info << tempStudent
    j+=1
end


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
            puts "Invalid input. Please enter 'A' or 'B'"
            instructor_response = gets.chomp
            instructor_response.upcase!
            valid_input = false
        end
end

m=0
while 
    m < num_students do
    puts studInfo(array_for_the_info[m]) 
    m+=1
end





