months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Year:"
year = gets.to_i

puts "Month: "
month = gets.to_i

puts "Day: "
day = gets.to_i

leap_year = (year % 400).zero? || (year % 4).zero? && (year % 100 != 0)
months[1] = 29 if leap_year

summ = 0
summ += months.take(month - 1).sum if month > 1
summ += day

puts summ
