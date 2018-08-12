
goods = {}

loop do 
  puts "Name : "
  item = gets.chomp

  break if item == "стоп"

  puts "Summ : "
  summ = gets.to_f 

  puts "Quantity :"
  quantity = gets.to_f

  goods[item] = { summ: summ, quantity: quantity }
end

if goods.any? 
  total_cost = 0

  goods.each do  |item, details|
    cost = details[:summ]* details [:quantity]

    puts "Name : #{item}"
    puts "Summ : #{details["summ"]}"
    puts "Total : #{cost}"
    puts ""

    total_cost += cost
  end

  puts "Final price : #{total_cost}"

end
