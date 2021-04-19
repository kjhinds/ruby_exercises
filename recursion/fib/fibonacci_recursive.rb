def fibs_rec(num)
  return [0] if num == 1
  return [0, 1] if num == 2
  [fibs_rec(num-1), fibs_rec(num-1)[-1]+fibs_rec(num-1)[-2]].flatten
end

puts '1:'
puts fibs_rec(1)
puts '2:'
puts fibs_rec(2)
puts '3:'
puts fibs_rec(3)
puts '5:'
puts fibs_rec(5)
puts '10:'
puts fibs_rec(10)
