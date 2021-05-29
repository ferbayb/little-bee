require 'pg'
require_relative '../classes/classUser.rb'

def db_connect(value)
    PG.connect( dbname: value)
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