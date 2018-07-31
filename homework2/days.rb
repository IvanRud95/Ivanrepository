months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts 'Date: '
day = gets.to_i

puts 'Month: '
month = gets.to_i

puts 'Year:' 
year = gets.to_i

months[:february] = 29 if (year % 4).zero? || (year % 400).zero?  && (year % 100 != 0)

result = day

i = 0
while i < month
  result += months.values[i]
  i += 1
end

puts "DATE #{result} "
