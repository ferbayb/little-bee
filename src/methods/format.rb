require "tty-prompt"
PROGRAM_WIDTH = 60
PROMPT = TTY::Prompt.new

def repeat(value, amount)
    puts value.to_s * amount
end

def line_br
    repeat("", PROGRAM_WIDTH)
end

def line
    repeat("-", PROGRAM_WIDTH)
end

def header
    line
    text("HONEYCOMB CHILDCARE MANAGEMENT SYSTEM", "center")
    line
    line_br
end

def text(value, format)
    if format == "center"
        puts value.center(PROGRAM_WIDTH)
    else
        puts value.to_s
    end
end

def clear
    system "clear"
end