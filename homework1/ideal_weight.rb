puts "What is your name?"
name = gets.chomp

puts "What is your height?"
height = gets.to_i

ideal_weight = 110

result = height - ideal_weight

if result > 0
  puts "#{name}. #{result} this is your ideal weight!"
else
  puts "Your weight is ideal"
end
