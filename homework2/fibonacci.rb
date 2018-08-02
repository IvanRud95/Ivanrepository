fibonacci = [0]

next_step = 1

while next_step < 100

  fibonacci << next_step
  next_step = fibonacci[-2] + fibonacci[-1]
end

puts fibonacci
