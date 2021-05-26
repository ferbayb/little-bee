require 'tty-prompt'
require 'colorize'
require_relative './methods/format.rb'
require_relative './methods/pg_conn.rb'
require_relative './methods/verify.rb'
require_relative './classes/classUser.rb'

header
text("Welcome to Honeycomb, User!", nil)
text("This system requires admin access.", nil)
line_br
preload_db
retrieve_profile

user_flag = nil
until user_flag != nil
    user_flag = retrieve_profile
end

pass_flag = false
until pass_flag == true
    pass_flag = check_pass(user_flag)
end
