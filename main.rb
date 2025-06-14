# frozen_string_literal: true

require_relative './lib/tree'

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
tree = Tree.new(array)

tree.pretty_print

p tree.preorder
