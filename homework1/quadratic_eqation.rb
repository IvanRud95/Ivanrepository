a = gets.to_i
print "a: "
b = gets.to_i
print "b: "
c = gets.to_i
print "c: "

discriminant = b**2 - 4 * a * c

if discriminant < 0
  puts "no solution"
elsif  d==0
  x = -b / (2 * a)
  puts "Equation root x = #{x}"
else
   dsqrt = Math.sqrt(d)
    x1 = (-b + dsqrt)/(2 * a)
    x2 = (-b - dsqrt)/(2 * a)
    puts "2 roots: x1 = #{x1}, x2 = #{x2}"
end
