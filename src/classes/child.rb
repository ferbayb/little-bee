class Child < Family
    attr_accessor :name, :dob

    def initialize(name)
        @name = name
        super()
    end

    def add_parent
        
    end
end