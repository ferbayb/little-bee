require 'pg'
def db
    conn = PG.connect( dbname: 'users_db')
end

def profile_by_username(name)
    conn = db
    query = "SELECT * FROM login_db WHERE user_name = '" + name + "';"
    conn.exec(query) do |result|
        result.each do |row|
            profile = {}
            profile['username'] = row['user_name']
            profile['password'] = row['user_pass']
            return profile
        end
        puts profile
    end
    puts profile
end

profile_by_username('Ben')