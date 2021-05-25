class Family
    attr_accessor :surname, :children, :guardians, :contact

    # Family.new("Smith") -> Smith.members = {}
    def initialize(surname)
        @surname = surname
        @guardians = []
        @children = []
        @contact = {}
    end

    #function to add a guardian to the family
    def add_guardian(name)
        name = Guardian.new
        @guardian.push(guardian)
    end
    #function to add child to family
    def add_child(name)
        name = Child.new
        @children.push(name)
    end
    #function to add contact information
    def add_contact(name, phone)
        @contact[name] = phone 
    end

    def list_members
        number_of_children = @children.length
        g = 0;
        c = 0;
        loop do
            if g < @guardians.length
                puts @guardians[g]
                g += 1
            else
                break
            end
        end

        loop do
            if c < @children.length
                puts @children
                c +=1
            else
                break
            end
        end   
    end
end
