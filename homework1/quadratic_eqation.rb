puts "Enter а"
a = gets.chomp.to_i

puts "Enter b"
b = gets.chomp.to_i

puts "Enter c"
c = gets.chomp.to_i

d = b ** 2 - 4 * a * c

if d >= 0
  x1 = (- b + Math.sqrt(d) ) / 2 * a
  x2 = (- b - Math.sqrt(d) ) / 2 * a
    if d > 0
       puts "Discriminant = #{d}, x1  = #{x1}, x2 = #{x2}"
    elsif d == 0
       puts "Discriminant = #{d}, x = #{x1}"
    end
  else
  puts "No solution"
end
