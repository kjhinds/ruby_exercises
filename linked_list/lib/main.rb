require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new
puts list

list.append('last')
puts list

list.prepend('first')
puts list

puts "Size: #{list.size}"
puts "Head: #{list.head.value}"
puts "Tail: #{list.tail.value}"
puts "At 1: #{list.at(1).value}"

list.pop
puts list

puts "Contains 'first': #{list.contains?('first')}"
puts "Contains 'last': #{list.contains?('last')}"
puts "Index of 'first': #{list.find('first')}"

list.insert_at('new_first', 0)
list.insert_at('new_last', 2)
puts list

list.remove_at(1)
puts list
