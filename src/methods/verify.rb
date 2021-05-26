require_relative '../classes/classUser.rb'

def retrieve_profile
    #get response
    response_name = PROMPT.ask("What is your name? (Case Sensitive)", required: true)
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
    response_pass = PROMPT.ask("What is your password? (Case Sensitive)", required: true)
    puts response_pass
    #get password hash
    all_passwords = User.class_variable_get(:@@all_passwords)
    #compare value of password associated with the retrieved id from previous function.
    id = profile.to_s
    puts id
    puts id.is_a?(String)
    if response_pass == all_passwords[id]
        puts "Confirmed!"
        return true
    else 
        puts "No such account."
    end
end