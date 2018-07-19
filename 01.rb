print 'Enter you name: '
name = gets.chomp
print 'Enter you heigth: '
height = gets.chomp.to_f

ideal_w = height - 110

puts
if ideal_w > 0
  puts "You ideal weigth is #{ideal_w}."
else
  puts 'Your weigth is ideal yet.'
end
