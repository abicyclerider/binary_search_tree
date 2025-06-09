require_relative './node'

def Tree
  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    return if array.empty?

    middle_index = array.empty? ? nil : array.length / 2

    node = Node.new(array[middle_index])
    node.left = build_tree(array[..middle_index - 1])
    node.right = build_tree(array[middle_index + 1..])
    
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end


end
