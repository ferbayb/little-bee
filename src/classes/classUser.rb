class User
    @@all_names = {}
    @@all_passwords = {}
    attr_accessor :id, :username, :password, :all_names, :all_passwords
    def initialize(id, username, password)
        @id = id
        @username = username
        @password = password
        @@all_names.store(id, username)
        @@all_passwords.store(id, password)
    end
end