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
        menu.choice "VIEW CHILDREN", 1
        menu.choice "EXIT APPLICATION", 2
    end
    return response
end

def retrieve_children
    while true
        #Ask client how they would like the children sorted.
        nav = PROMPT.select("Sort by:") do |menu|
            menu.choice name: "NAME", value: 1
            menu.choice name: "ID", value: 2
            menu.choice name: "ROOM", value: 3
            menu.choice name: "BACK", value: 4
            menu.choice name: "EXIT", value: 5
        end

        return "BACK" if nav == 4;
        exit if nav == 5;
        
        child = select_sorted_children(nav)
        next if child == "BACK"
        return child
    end
end

def select_sorted_children(nav) 
    while true
    #Set up a new array with the value "BACK" to be populated with the children, sorted in some manner.
    sorted = ["BACK"]
    #Set up a string to identify which way it has been sorted through. 
    sorted_by = ""
    
    selection = ""
    #Sort children depending on response.
    
    case nav

    #Sort alphabetically by name
    when 1
        unsorted = ChildProfile.class_variable_get(:@@child_by_name)
        sorted.push(unsorted.sort)
        sorted_by = "NAME"

    #Sort numerically by ID. 
    when 2
        unsorted = ChildProfile.class_variable_get(:@@child_by_id)
        sorted.push(unsorted.map{|list| "ID: " + list[0] + " | " + list[1]})
        sorted_by = "ID"

    #Sort by age.
    when 3
        sorted_by = "ROOM"
        sort_nav = PROMPT.select("Select which room:") do |menu|
            menu.choice name: "KOALA (0-1 YEARS)", value: 1
            menu.choice name: "ECHIDNA (2-3 YEARS)", value: 2
            menu.choice name: "JOEY (4-6 YEARS)", value: 3
            menu.choice name: "BACK", value: 5
            menu.choice name: "EXIT", value: 6
        end
        
        sorted_room = ["BACK"]
        by_room = ""
        age_min = 0
        age_max = 0
        #Appropriate sorting by client response. 
        case sort_nav
        
        #Show children between 0 and 1 years.
        when 1
            by_room = "KOALA"
            age_min = 0
            age_max = 1

        #Show children between 2 and 3 years.
        when 2
            by_room = "ECHIDNA"
            age_min = 2
            age_max = 3

        #Show children between 4 and 5 years.
        when 3
            by_room = "JOEY"
            age_min = 4
            age_max = 5
            
        #Return to previous menu.
        when 5
            return "BACK"

        #exit application
        when 6
            exit
        end

        # each child object has @age paramater, sort @age between x < age < y into respective rooms. 
        filtered = ChildProfile.class_variable_get(:@@children).select { |child| child.age[:year] >= age_min && child.age[:year] <= age_max };
        filtered = filtered.sort { |one, two| (one.age[:year]*12) + one.age[:month] + (one.age[:day]/100.0) <=> (two.age[:year]*12) + two.age[:month] + (two.age[:day]/100.0) }
        sorted.push filtered.map { |child| "#{child.name}, #{child.age[:year]} years, #{child.age[:month]} months and #{child.age[:day]} days old."}
    when 4
        return "BACK"
    end

    selection = PROMPT.select("Viewing children by #{sorted_by}:", sorted, filter: true, per_page: 10)
    
    return "BACK" if selection == "BACK"

    selected_child = nil
    case sorted_by
    when "NAME"
        selected_child = ChildProfile.class_variable_get(:@@children).find { |child| child.name == selection}
    when "ID"
        proper_name = selection.split(" | ")[1]
        selected_child = ChildProfile.class_variable_get(:@@children).find { |child| child.name == proper_name}
    when "ROOM"
        proper_name = selection.split(", ")[0]
        selected_child = ChildProfile.class_variable_get(:@@children).find { |child| child.name == proper_name}
    end
    return selected_child;
end
end
