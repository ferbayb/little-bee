require 'date'
require 'span'

d = Date.today
puts d.strftime('%d/%m/%Y')

end_date = Date.parse d.to_s
start_date = Date.parse '01/01/2012'
result = Span.compute end_date , start_date
puts result
