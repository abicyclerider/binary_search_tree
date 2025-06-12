require_relative './lib/tree'


array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
tree = Tree.new(array)


tree.pretty_print
tree.insert(21)
tree.pretty_print
tree.insert(-1)
tree.pretty_print
tree.insert(4)
tree.pretty_print
