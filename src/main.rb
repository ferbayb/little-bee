require 'tty-prompt'
require 'colorize'
require_relative './methods/format.rb'
require_relative './methods/database.rb'
require_relative './methods/prompts.rb'
require_relative './methods/database.rb'
require_relative './classes/classUser.rb'
require_relative './classes/classChild.rb'

def show_profile(child)
    clear
    header
    line
    puts child.name
end

def main
    clear
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
    
    #load child database
    load_db('child_db')
    
    while true
    text("Please navigate the application through the following menu:", nil)
    #launch navigation menu
    case navigate_main
    when 1
        child = retrieve_children
        next if child == "BACK"
        show_profile(child)
    when 2
        exit
    end
    end
end

main