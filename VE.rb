=begin
Michael De George
csc415
9/22/22
=end

require_relative 'QuickGroups'
require_relative 'sort'

puts "View-A OR Edit-B"
if "A"

    def do_view (view,args) 
    case view 
    when "View"
        puts "\nView File\n\n".upcase!
        CSV.foreach("Test.csv") do |row|
            puts row.inspect
        end
    end
end
elsif "B"
    array_for_the_info.push.gets.chomp
    puts array_for_the_info
end