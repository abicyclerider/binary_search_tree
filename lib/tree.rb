require_relative './node'

class Tree
  attr_reader :root
  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    if array.empty?
      return
    elsif array.length == 1
      node = Node.new(array[0])
    else
      middle_index = array.empty? ? nil : array.length / 2
      node = Node.new(array[middle_index], build_tree(array[..middle_index - 1]), build_tree(array[middle_index + 1..]))
    end
    node
  end

  def insert(value, node = @root)
    if value > node.data 
      next_node = node.right
    else 
      next_node = node.left
    end
    if next_node == nil
      node.right = Node.new(value)
      return
    else
      insert(value, next_node)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end
