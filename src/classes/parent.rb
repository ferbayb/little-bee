class Parent
    attr_accessor :name, :surname, :children, :phone, :email, :address

    # Parent.new("John", "Smith") -> Smith.members = {}
    def initialize(name, surname)
        @name = name
        @surname = surname
        @children = []
        @phone = ''
        @email = ''
        @address = ''
    end

    def add_attribute(mode, value)
        if mode == "phone"
            @phone == value
        elsif mode == "email"
            @email == value
        elsif mode == "child"
            @children.push(value)
            value.add_parent(self)
        elsif mode == "address"
            @address == value
        end
    end
end
