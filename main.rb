# frozen_string_literal: true

require_relative './lib/tree'

array = (Array.new(15) { rand(1..100) })
tree = Tree.new(array)

tree.pretty_print
p tree.balanced?
# p tree.level_order
# p tree.postorder
# p tree.inorder
# p tree.preorder
values = [1010, 1020, 1030, 1040, 1050, 1060]
values.each { |value| tree.insert(value) }
tree.balanced?
#tree.rebalance!
tree.pretty_print
p tree.balanced?
