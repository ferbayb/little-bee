class User
  @@all_names = {}
  @@all_passwords = {}
  attr_accessor :id, :username, :password, :all_names, :all_passwords

  def initialize(user)
    @id = user[:id]
    @username = user[:user_name]
    @password = user[:user_pass]
    @@all_names.store(@id, @username)
    @@all_passwords.store(@id, @password)
  end
end
