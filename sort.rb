=begin 
Michael De George
csc415
9/22/22
=end
require_relative 'QuickGroups' #includes the statement to include the main file quick groups



puts "Which method do you want to sort by? By Major(s)-A OR by Section-B" #put statement with choices for the user
input=gets.chomp #gets input from the user 


#while statement also using a if loop to try and sort by major using parts of the main Quick Gorups Code

while 
    if
        input == "A"
        input.upcase!
        require "csv"
        require_relative'sort.rb' # inlcudes file and declares user input as A also taking in the csv file
        
        puts"Enter the input file"
        input = gets.chomp #asks to enter the input and takes user input
        
        puts "Enter the output file"
        output=gets.chomp #ask for the user output and takes the user input
        
        CSV.read(input) #reads the input file
        CSV.open(output) #reads opens the output file
        
        info=CSV.parse(File.read(input),headers: true, col_sep: " ") #takes in read file and declares the tittles of the student info as headers and takes a space to read out the actual input from the test file
        num_students = info.size #takes the size of the command line above and declares it as num_students 
        
        Student = Struct.new(:first_name, :last_name, :email, :major1, :major2, :minor1, :minor2, :section) 
        
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
        
        #Creates a structure, the structure is then used to declare the full name and major this will be used later on to sort the file
        
        array_for_the_info = [Student.new]
        j=0
        
        while j < num_students
            tempStudent = Student.new(info[j]["first_name"], info[j]["last_name"],info[j]["major1"], info[j]["major2"])
            array_for_the_info << tempStudent
            j+=1
        end
        
        #an array for the structure so now the students and student info has been placed in the array, but as tempoary files since they will be changed or stored and not printed but this includes only the majors since that was what the user chose
        
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
         
#This function takes the user input and creates an if loop to declare whether the headers minor 1 minor 2 and major 2 are valid, since not every student validates these credentials 

        m = 1
        while m < num_students
            puts studInfo(array_for_the_info[m])
            m+=1
        end
        array_for_the_info.shuffle
        
        # this checks to see if the array actually works and prints the finialzed data and closes the loop for if the user chose A 
            

        #else if statement for B begins 
    elsif
        input == "B"
        input.upcase!

        require "csv"
require_relative'sort.rb'

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
        puts "Minor or Minors: #{student.minor1}"
        end
            if student.minor2 != nil
        puts " and #{student.minor2}"
            end
        puts "Section: #{student.section}"
end



array_for_the_info = [Student.new]
j=0

while j < num_students
    tempStudent = Student.new(info[j]["first_name"], info[j]["last_name"], info[j]["section"])
    array_for_the_info << tempStudent
    j+=1
end

#Now since this is the same as the code above the temporary values only store the students full name and the section since the user inputed B which is to sort by section

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
 
m = 1
while m < num_students
     studInfo(array_for_the_info[m])
    puts array_for_the_info.shuffle
    m+=1
end

    end
end

#end for all statements and finsihes sort statements 
