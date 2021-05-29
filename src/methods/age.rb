require 'date'
require 'span'
require_relative '../classes/classChild'

def calc_age(dob)
    #convert today's date to acceptable format
    d = Date.today
    d.strftime('%d/%m/%Y')
    #convert given date to acceptable format
    pre_dob = Date.strptime(dob, '%Y-%m-%d')
    post_dob = pre_dob.strftime('%d/%m/%Y')
    #declare new dates to appropriate variables
    start_date = Date.parse post_dob
    end_date = Date.parse d.to_s
    #compute date difference with span gem
    age = Span.compute end_date, start_date
    return age
end