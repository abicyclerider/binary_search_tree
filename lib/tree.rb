# frozen_string_literal: true

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
    elsif value < node.data
      next_node = node.left
    else
      return
    end
    if next_node.nil? && value > node.data
      node.right = Node.new(value)
      nil
    elsif next_node.nil? && value <= node.data
      node.left = Node.new(value)
      nil
    else
      insert(value, next_node)
    end
  end

  def delete(value, root = @root)
    return if root.nil?

    if root.data > value
      root.left = delete(value, root.left)

    elsif root.data < value
      root.right = delete(value, root.right)

    else
      return root.right if root.left.nil?
      return root.left if root.right.nil?

      successor = get_successor(root)
      root.data = successor.data
      root.right = delete(successor.data, root.right)
    end

    root
  end

  def get_successor(curr)
    return nil if curr.nil? || curr.right.nil?

    curr = curr.right
    curr = curr.left until curr.left.nil?
    curr
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if value == node.data

    value > node.data ? find(value, node.right) : find(value, node.left)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def level_order(values = [], queue = [@root], &block)
    return if queue.empty?

    node = queue.shift

    values << (block_given? ? yield(node.data) : node.data)

    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?

    level_order(values, queue, &block)

    values
  end

  # def inorder(values = [], queue, &block)
  # end

  def preorder(values = [], root = @root, &block)
    return if root.nil?

    values << (block_given? ? root.data : yield(root.data))
    preorder(values, root.left, &block)
    preorder(values, root.right, &block)

    values
  end

  # def postorder(values = [], queue, &block)
  # end
end
