months = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

puts "Enter day"
input_day = gets.to_i
puts "Enter month"
input_month = gets.to_i
puts "Enter year"
input_year = gets.to_i


months[:february] = 29 if (year % 4).zero? || (year % 400).zero?

result = day

i = 0
while i < month
  result += months.values[i]
  i += 1
end
