require_relative '../classes/classUser.rb'
require_relative '../classes/classChild.rb'

def retrieve_profile
    #get response
    response_name = PROMPT.ask("What is your name? (Case Sensitive)", required: true)
    exit if response_name.downcase == "exit" || response_name.downcase == "quit"
    #get complete list to compare response to
    all_names = User.class_variable_get(:@@all_names)
    #Is there a value that matches the response?
    if all_names.has_value?(response_name)
        #What's the id of the listing that has the value?
        current_id = all_names.key(response_name).to_i
        #Return the id for later use
        puts "Account Found!"
        return current_id
    elsif all_names.has_value?(response_name) == false
        puts "No account found! Try again."
        return nil
    end
end

def check_pass(profile)
    #get response
    response_pass = PROMPT.mask("What is your password? (Case Sensitive)", required: true)
    #get password hash
    all_passwords = User.class_variable_get(:@@all_passwords)
    #compare value of password associated with the retrieved id from previous function.
    id = profile.to_s
    if response_pass == all_passwords[id]
        puts "Confirmed!"
        return true
    else 
        puts "No such account."
    end
end

def navigate_main
    response = PROMPT.select("What would you like to do?") do |menu|
        menu.enum "."
        menu.choice "SEARCH FOR CHILD", 1
        menu.choice "VIEW ALL CHILDREN", 2
        menu.choice "QUIT APPLICATION", 3
    end
    return response
end

def retrieve_children
    nav = PROMPT.select("Sort By:") do |menu|
        menu.choice name: "BY NAME", value: 1
        menu.choice name: "BY ID", value: 2
        menu.choice name: "BY ROOM", value: 3
        menu.choice name: "QUIT", value: 4
    end

    case nav
    when 1
        children = ChildProfile.class_variable_get(:@@child_by_name)
        PROMPT.select("CHILD BY NAME", children.sort)
    when 2
        unsorted = ChildProfile.class_variable_get(:@@child_by_id)
        sorted = []
        unsorted.each do |list|
            temp = "ID: " + list[0] + " | " + list[1]
            sorted.push(temp)
        end
        PROMPT.select("CHILD BY ID:", sorted)
    when 3
        exit
    when 4
        exit
    end
end