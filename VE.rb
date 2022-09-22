=begin
Michael De George
csc415
9/14/22
=end

require_relative 'QuickGroups'
require 'sort'

def do_view (view,args) 
    case view 
    when "View"
        puts "\nView File\n\n".upcase!
        CSV.foreach("Test.csv") do |row|
            puts row.inspect
        end
    end
end
