class Student
    attr_accessor :first_name, :last_name, :email, :major1, :major2, :minor1, :minor2, :section
    
    def initialize(first_name, last_name, email, major1 = nil, major2 = nil, minor1 = nil, minor2 = nil, section =nil)
      @first_name = first_name 
      @last_name = last_name
      @email = email
      @major1 = major1
      @major2 = major2
      @minor1 = minor1
      @minor2 = minor2
      @section = section
    end
  
    def full_name
      "#{first_name} #{last_name}"
    end
  
    def section
      @section
    end 
  end