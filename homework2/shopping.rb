
products = {}

until products['stop']
  puts 'Name:'
  product_name = gets.chomp

  break if product_name == 'stop'

  puts 'Price'
  product_price = gets.to_i

  puts 'Quantity'
  product_count = gets.to_f

  products[product_name] = {
    price: product_price,
    count: product_count,
    total: (product_price * product_count).to_i
  }
end

puts products

total_sum = 0

products.each_value do |product|
  total_sum += product[:total]
end

puts '-----'
puts "Final Price #{total_sum}"



