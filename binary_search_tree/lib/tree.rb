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

  def find(data, root_node = @root)
    if root_node.nil? || root_node.data == data
      root_node
    elsif root_node.data < data
      find(data, root_node.right)
    else
      find(data, root_node.left)
    end
  end

  def insert(data, root_node = @root)
    if root_node.nil?
      Node.new(data)
    else
      if root_node.data < data
        root_node.right = insert(data, root_node.right)
      elsif root_node.data > data
        root_node.left = insert(data, root_node.left)
      end
      root_node
    end
  end

  def delete(data, root_node = @root)
    return root_node if root_node.nil?

    if data < root_node.data
      root_node.left = delete(data, root_node.left)
    elsif data > root_node.data
      root_node.right = delete(data, root_node.right)
    else
      return node.right if root_node.left.nil?
      return node.left if root_node.right.nil?

      temp = min_value_node(root_node.right)
      root_node.data = temp.data
      root_node.right = delete(temp.data, root_node.right)
    end
    root_node
  end

  def min_value_node(node)
    node = node.left until node.left.nil?
    node
  end

  def level_order(root_node = @root)
    array = []
    queue = []
    current_node = root_node
    until current_node.nil? do
      print "#{current_node.data} "
      array.push(current_node.data)
      queue.push(current_node.left) unless current_node.left.nil?
      queue.push(current_node.right) unless current_node.right.nil?
      current_node = queue.shift
    end
  end

  def inorder(node = @root)
    return if node.nil?

    inorder(node.left)
    print "#{node.data} "
    inorder(node.right)
  end

  def preorder(node = @root)
    return if node.nil?

    print "#{node.data} "
    preorder(node.left)
    preorder(node.right)
  end

  def postorder(node = @root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    print "#{node.data} "
  end

  def height(node = @root)
    unless node.nil? || node == @root
      node = (node.instance_of?(Node) ? find(node.data) : find(node))
    end

    return -1 if node.nil?

    [height(node.left), height(node.right)].max + 1
  end

  def depth(node = @root, parent = @root, edges = 0)
    return 0 if node == parent
    return -1 if parent.nil?

    if node < parent.data
      edges += 1
      depth(node, parent.left, edges)
    elsif node > parent.data
      edges += 1
      depth(node, parent.right, edges)
    else
      edges
    end
  end

  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

    false
  end

  def rebalance
    self.root = build_tree(inorder_array)
  end

  def inorder_array(node = @root, array = [])
    unless node.nil?
      inorder_array(node.left, array)
      array.push(node.data)
      inorder_array(node.right, array)
    end
    array
  end

  # Method from The Odin Project
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

array = Array.new(15) { rand(1..100) }
bst = Tree.new(array)

bst.pretty_print

puts bst.balanced? ? 'Binary Search Tree is balanced.' : 'Binary Search Tree is not balanced.'

puts 'Level-order traversal: '
puts bst.level_order

puts 'Inorder traversal: '
puts bst.inorder

puts 'Preorder traversal: '
puts bst.preorder

puts 'Postorder traversal: '
puts bst.postorder

10.times do
  a = rand(100..150)
  bst.insert(a)
  puts "Inserted #{a} to tree."
end

bst.pretty_print

puts bst.balanced? ? 'Binary Search Tree is balanced.' : 'Binary Search Tree is not balanced.'

puts 'Rebalancing tree.'
bst.rebalance

bst.pretty_print

puts bst.balanced? ? 'Binary Search Tree is balanced.' : 'Binary Search Tree is not balanced.'

puts 'Level-order traversal: '
puts bst.level_order

puts 'Inorder traversal: '
puts bst.inorder

puts 'Preorder traversal: '
puts bst.preorder

puts 'Postorder traversal: '
puts bst.postorder
