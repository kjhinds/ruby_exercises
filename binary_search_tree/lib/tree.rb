require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    return nil if array.nil?

    midpoint = (array.length / 2).round
    root_node = Node.new(array[midpoint])

    root_node.left = build_tree(array[0...midpoint])
    root_node.right = build_tree(array[midpoint+1..array.length])

    root_node
  end
end
