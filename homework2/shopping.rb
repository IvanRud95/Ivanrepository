cart = {}
sum = 0
loop do
  print "Name (or \"stop\"): "
  name = gets.chomp
  break if name == "stop"
  print "price: "
  price = gets.chomp.to_f
  print "quantaty: "
  count = gets.chomp.to_f
  
  cart[name] = {"price" => price, "count" => count}  
end 

cart.each {|name, hash| sum += hash["price"] * hash["count"]}

puts cart
puts "Finally: #{sum}"
