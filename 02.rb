def insert_user(index)
  if index.to_i == 1
    puts 'Enter the length of the base'
  else
    puts 'Enter the heigh of the base'
  end
  Float(gets.chomp)
rescue StandardError
  puts 'Enter a number or a number with a floating point'
  retry
end
a = insert_user(1)
h = insert_user(2)
square = 0.5 * a * h

puts "The area of the triangle is #{square} ."
