require 'pg'
require_relative '../methods/pg_conn.rb'

class User
    attr_accessor :id, :username, :password, :all_users

    def initialize(id, username, password)
        @id = id
        @username = username
        @password = password
    end

end