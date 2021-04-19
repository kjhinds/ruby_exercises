def fibs(num)
  fib = [0, 1]
  fib.push(fib[-1] + fib[-2]) while fib.length < num
  fib[0..num - 1]
end

puts '1:'
puts fibs(1)
puts '5:'
puts fibs(5)
puts '3:'
puts fibs(3)
puts '10:'
puts fibs(10)
