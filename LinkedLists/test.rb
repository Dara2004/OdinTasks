require_relative 'linked_list.rb'
nodes = LinkedList.new

nodes.append('a')
nodes.append('b')
nodes.append('c')
nodes.append('d')

nodes.prepend('g')

puts nodes.head.node

nodes.to_s
nodes.pop
nodes.to_s
nodes.append('z')
nodes.to_s
nodes.append('c')
nodes.append('d')
nodes.to_s

puts nodes.contains?('q')
puts nodes.find('a')

puts nodes.at(4).node
nodes.insert_at(4,'x')
nodes.to_s
puts nodes.node_size
nodes.remove_at(4)
nodes.to_s