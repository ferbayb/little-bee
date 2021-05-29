require_relative "../methods/age.rb"

class ChildProfile
    @@child_by_id = {}
    @@child_by_name = []
    @@child_dob = {}
    @@children = []
    attr_accessor :id, :name, :dob, :gender, :guardian_1_name, :guardian_1_email, :guardian_1_address, :guardian_1_phone, :age, :guardian_2_name, :guardian_2_email, :guardian_2_address, :guardian_2_phone
    #DOB RETURNS #YYYY-MM-DD
    def initialize(child)
        #child information
        @id = child['id']
        @name = child['name']
        @dob = child['dob']
        if child['gender'] == "Male"
            @gender = "boy"
        else
            @gender = "girl"
        end
        @age = calc_age(@dob)  
        #guardian 1 information
        @guardian_1_name = child['guardian_1_name']
        @guardian_1_phone = child['guardian_1_phone']
        @guardian_1_email = child['guardian_1_email']
        @guardian_1_address = child['guardian_1_address']
        #guardian 2 information
        @guardian_2_name = child['guardian_2_name']
        @guardian_2_phone = child['guardian_2_phone']
        @guardian_2_email = child['guardian_2_email']
        @guardian_2_address = child['guardian_2_address']
        #push id, name pair to global hash.
        @@child_by_id.store(@id, @name)
        @@child_by_name.push(@name)
        @@child_dob.store(@id, @dob)
        #push self object to array
        @@children.push(self)
    end
end