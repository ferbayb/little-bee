require 'tty-prompt'
require 'colorize'
require_relative './methods/format.rb'
require_relative './methods/pg_conn.rb'


header
text("Welcome to Honeycomb, User!", nil)
text("This system requires admin access.", nil)
line_br

def check_username
    username = PROMPT.ask("What is your username?", required: true)
    return username
end

check_username