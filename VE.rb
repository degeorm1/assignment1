=begin
Michael De George
csc415
9/22/22
=end

#includes programs made previouslly to sort and main file for the assignment

require_relative 'QuickGroups'
require_relative 'sort'


puts "View-A OR Edit-B" #puts statement to view or edit in a if statement so it understands if userstatds whichever choice the user inputed
if "A" #if statement for choice A

    def do_view (view,args) #defining the mehtod do_view to view the file 
    case view #case statement for when you are viewing the file
    when "View" #when statement which is telling the computer literally when some method is happening 
        puts "\nView File\n\n".upcase! ##allows you to view the file and place it in upcase 
        CSV.foreach("Test.csv") do |row| # Views the array of the student info by row because of the do statement 
            puts row.inspect #prints the array of the file it just read, the student info 
        end
    end
end #end statements to clsoe the def, case and when statments
elsif "B" #contiues the if statement with a else if statement 
    array_for_the_info.push.gets.chomp #adds to array, student info 
    puts array_for_the_info # prints the array for the stduent info with the new student added to it 
end 
#end of file 
