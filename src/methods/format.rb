# frozen_string_literal: true

require 'tty-prompt'
PROGRAM_WIDTH = 60
PROMPT = TTY::Prompt.new

def repeat(value, amount)
  puts value.to_s * amount
end

def line_br
  repeat('', PROGRAM_WIDTH)
end

def line
  repeat('-'.colorize(:light_red), PROGRAM_WIDTH)
end

def header
  line
  text('LITTLE BEE CHILDCARE MANAGEMENT SYSTEM', 'center')
  line
  line_br
end

def text(value, format)
  if format == 'center'
    puts value.center(PROGRAM_WIDTH).colorize(:black).on_light_white
  else
    puts value.to_s.colorize(:magenta).on_light_white
  end
end

def clear
  system 'clear'
end

def show_profile(child)
  clear
  header
  puts "Hello! My name is #{child.name}."
  puts "I am a #{child.age[:year]} years, #{child.age[:month]} months old #{child.gender}."
  puts "My date of birth is #{child.dob}."
  line_br
  line
  text('CONTACT DETAILS', 'center')
  line
  line_br
  puts 'Guardian 1'.center(PROGRAM_WIDTH).uncolorize
  puts '--------'.center(PROGRAM_WIDTH).uncolorize
  puts child.guardian_1_name.to_s
  puts child.guardian_1_address.to_s
  puts "PH: #{child.guardian_1_phone}"
  puts "EMAIL: #{child.guardian_1_email}"
  line_br
  puts 'Guardian 2'.center(PROGRAM_WIDTH).uncolorize
  puts '--------'.center(PROGRAM_WIDTH).uncolorize
  puts child.guardian_2_name.to_s
  puts child.guardian_2_address.to_s
  puts "PH: #{child.guardian_2_phone}"
  puts "EMAIL: #{child.guardian_2_email}"
end
