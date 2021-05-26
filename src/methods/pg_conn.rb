require 'pg'
require_relative '../classes/user.rb'
require_relative '../classes/child.rb'
require_relative '../classes/parent.rb'

def db_connect
    PG.connect( dbname: 'users_db')
end
    #query = "SELECT * FROM login_db WHERE user_name = '" + name + "';"

def db_user
    #connect to database
    db = db_connect
    #run SQL query in database. 
    query = "SELECT * FROM login_db"
    #return each listing
    db_results = db.exec(query)
    db_results.each do |user|
        puts user
    end
end

db_load