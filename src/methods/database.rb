require 'pg'
require 'sequel'
require_relative '../classes/classUser.rb'

def db_connect    
    # host = String('topsy.db.elephantsql.com')
    # database = String('rzffyrvr')
    # user = String('rzffyrvr')
    # port = 5432
    # password = String('ADsfbAJTndN2BkM5mNGTcgGKCZwkEHSD')
    db = Sequel.connect ENV['postgres://rzffyrvr:ADsfbAJTndN2BkM5mNGTcgGKCZwkEHSD@topsy.db.elephantsql.com/rzffyrvr'] || 'postgres://localhost/contacts'
end

def load_db(value)
    #connect to database
    db = db_connect("users_db")
    #run SQL query in database. 
    query = "SELECT * FROM #{value}"
    db_results = db.exec(query)
    #create object from each listing
    case value
    when "login_db"
        db_results.each do |listing|
            User.new(listing)
        end
    when "child_db"
        db_results.each do |listing|
            ChildProfile.new(listing)
        end
    end
    #close connection
    db.close
    #puts "#{value} Database Loaded, Delete This Message Before Shipping"
end

puts db_connect