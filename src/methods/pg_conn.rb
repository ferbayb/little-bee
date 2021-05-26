require 'pg'
require_relative '../classes/classUser.rb'

def db_connect
    PG.connect( dbname: 'users_db')
end

def preload_db
    #connect to database
    db = db_connect
    #run SQL query in database. 
    query = "SELECT * FROM login_db"
    db_results = db.exec(query)
    #create user object from each listing
    db_results.each do |listing|
        User.new(listing['id'], listing['user_name'], listing['user_pass'])
    end
    #close connection
    db.close
    puts "Database Loaded, Delete This Message Before Shipping"
end

