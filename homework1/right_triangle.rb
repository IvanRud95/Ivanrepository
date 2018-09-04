puts "Enter side a"
a = gets.to_f

puts "Enter side b"
b = gets.to_f

puts "Endter side c"
c = gets.to_f

if a == b &&  b == c && a == c
  puts "Triangle is right"
  exit
end

hypotenuse = [a, b, c].max
cat1, cat2 = [a, b, c].min(2)
rectangular = hypotenuse**2 == cat1**2 + cat2**2
