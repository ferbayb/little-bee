require_relative "../methods/age.rb"

class ChildProfile
    @@child_by_id = {}
    @@child_by_name = []
    @@child_dob = {}
    @@children = []
    attr_accessor :id, :name, :dob, :gender, :guardians, :age
    #DOB RETURNS #YYYY-MM-DD
    def initialize(child)
        #child information
        @id = child['id']
        @name = child['name']
        @dob = child['dob']
        @gender = child['gender']
        @guardians = {}
        @age = calc_age(@dob)
        
        #guardian 1 information
        @guardian_1_name = child['guardian_1_name']
        @guardian_1_phone = child['guardian_1_phone']
        @guardian_1_email = child['guardian_1_email']
        @guardian_1_address = child['guardian_1_address']

        #create guardian_1 object
        @guardian_1 = {}
        @guardian_1.store("name", @guardian_1_name)
        @guardian_1.store("phone", @guardian_1_phone)
        @guardian_1.store("email", @guardian_1_email)
        @guardian_1.store("address", @guardian_1_address)
        @guardians.store(1, @guardian_1)

        #guardian 2 information
        @guardian_2_name = child['guardian_2_name']
        @guardian_2_phone = child['guardian_2_phone']
        @guardian_2_email = child['guardian_2_email']
        @guardian_2_address = child['guardian_2_address']

        #create guardian_2 object
        @guardian_2 = {}
        @guardian_2.store("name", @guardian_2_name)
        @guardian_2.store("phone", @guardian_2_phone)
        @guardian_2.store("email", @guardian_2_email)
        @guardian_2.store("address", @guardian_2_address)
        @guardians.store(2, @guardian_2)

        #push id, name pair to global hash.
        @@child_by_id.store(@id, @name)
        @@child_by_name.push(@name)
        @@child_dob.store(@id, @dob)

        #push self object to array
        @@children.push(self)
    end
end