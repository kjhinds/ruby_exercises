require_relative 'node'

class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.uniq.sort)
  end

  def build_tree(array)
    return nil if array.empty?

    midpoint = (array.length / 2).round
    root_node = Node.new(array[midpoint])

    root_node.left = build_tree(array[0...midpoint])
    root_node.right = build_tree(array[midpoint + 1..array.length])

    root_node
  end

  def find(root_node, value)
    if root_node.nil? || root_node.value == value
      root_node
    elsif root_node.value < value
      find(root_node.right, value)
    else
      find(root_node.left, value)
    end
  end

  def insert(root_node, value)
    if root_node.nil?
      Node.new(value)
    else
      if root_node.value < value
        root_node.right = insert(root_node.right, value)
      elsif root_node.value > value
        root_node.left = insert(root_node.left, value)
      end
      root_node
    end
  end

  def delete(root_node, value)
    return root_node if root_node.nil?

    if value < root_node.value
      root_node.left = delete(root_node.left, value)
    elsif value > root_node.value
      root_node.right = delete(root_node.right, value)
    else
      return node.right if root_node.left.nil?
      return node.left if root_node.right.nil?

      temp = min_value_node(root_node.right)
      root_node.value = temp.value
      root_node.right = delete(root_node.right, temp.value)
    end
    root_node
  end

  def min_value_node(node)
    node = node.left until node.left.nil?
    node
  end

  def level_order(root_node)
    array = []
    queue = []
    current_node = root_node
    until current_node.nil? do
      array.push(current_node.value)
      queue.push(current_node.left) unless current_node.left.nil?
      queue.push(current_node.right) unless current_node.right.nil?
      current_node = queue.shift
    end
    array
  end
end
