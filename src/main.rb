require 'tty-prompt'
require 'colorize'
require_relative './methods/format.rb'
require_relative './methods/database.rb'
require_relative './methods/prompts.rb'
require_relative './methods/database.rb'
require_relative './classes/classUser.rb'
require_relative './classes/classChild.rb'

header
text("Welcome to Honeycomb, User!", nil)
text("This system requires admin access.", nil)
line_br
#connect to database
load_db("login_db")
#ask for username and verify
user_flag = nil
until user_flag != nil
    user_flag = retrieve_profile
end
#ask for password and verify
pass_flag = false
until pass_flag == true
    pass_flag = check_pass(user_flag)
end
#start new page
clear
header
text("Your identity has been confirmed!", nil)
text("Please navigate the application through the following menu:", nil)
#launch navigation menu
nav = navigate_main
case nav
when 1
    #h.fetch?
when 2
    #load child database
    load_db('child_db')
    retrieve_children
when 3
    puts 3
when 4
    exit
end