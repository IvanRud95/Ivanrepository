days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Please, enter day:"
day = gets.to_i

puts "Please, enter month:"
month = gets.to_i

puts "Please, enter year:"
year = gets.to_i

days [1] = 29 if year % 400 == 0 || year % 4 == 0 && year % 100 != 0

num = 0
days [0...month - 1].each { |month| num += month }
num += day
puts "this is #{num} day"
