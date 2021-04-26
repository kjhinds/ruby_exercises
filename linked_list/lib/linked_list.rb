require_relative 'node'

class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    @tail.nil? ? @head = node : @tail.next_node = node
    @tail = node
    @size += 1
  end

  def prepend(value)
    node = Node.new(value)
    @head.nil? ? @tail = node : node.next_node = @head
    @head = node
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    return nil if index > size

    node = @head
    index.times do
      node = node.next_node
    end
    node
  end

  def pop
    return nil if @size.zero?

    node = @head
    node = node.next_node until node.next_node == @tail
    removed_node = node.next_node
    node.next_node = nil
    @tail = node
    @size -+ 1
    removed_node
  end

  def contains?(value)
    node = @head
    return node.value == value if node == @tail

    until node.nil?
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    index = 0
    node = @head
    until node.nil?
      return index if node.value == value

      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    node = @head

    until node.nil?
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    print 'nil'
  end

  def insert_at(value, index)
    return puts 'Error: index out of range.' if index >= @size

    if index.zero?
      prepend(value)
    else
      new_node = Node.new(value)
      new_node.next_node = at(index)
      prev_node = at(index-1)
      prev_node.next_node = new_node
      @tail = new_node if new_node.next_node.nil?
    end
    @size += 1
  end

  def remove_at(index)
    return puts 'Error: index out of range.' if index >= @size

    @size -= 1
    return @head = @head.next_node if index.zero?
    return pop if index == @size

    node = @head
    prev_node = nil
    index.times do
      prev_node = node
      node = node.next_node
    end
    prev_node.next_node = node.next_node
  end
end
