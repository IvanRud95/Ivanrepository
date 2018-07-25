puts "Enter your name"
name = gets.to_i

puts "Enter your heigth"
height = gets.to_i

ideal_weight = height - 110

if ideal_weight < 0 
  puts "#{name}, your weight is ideal!"
else
  puts "#{name}, your ideal weight is #{ideal_weight}kg!"
end
