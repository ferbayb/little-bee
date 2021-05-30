require 'tty-prompt'
require 'colorize'
require_relative './methods/format'
require_relative './methods/database'
require_relative './methods/prompts'
require_relative './classes/class_user'
require_relative './classes/class_child'

def main
  clear
  header
  text('Welcome to Little Bee, User!', 'center')
  line_br
  text('This system requires admin access.'.italic, nil)
  # connect to database
  load_db('login_db')
  # ask for username and verify
  user_flag = nil
  user_flag = retrieve_profile while user_flag.nil?
  # ask for password and verify
  pass_flag = false
  pass_flag = check_pass(user_flag) until pass_flag == true
  # start new page
  clear
  header
  text('Your identity has been confirmed!'.italic, nil)

  # load child database
  load_db('child_db')

  while true
    text('Please navigate the application through the following menu:', nil)
    # launch navigation menu
    case navigate_main
    when 1
      child = retrieve_children
      next if child == 'BACK'

      if child != 'BACK'
        show_profile(child)
        return false
      end
    when 2
      exit
    end
  end
end

main
