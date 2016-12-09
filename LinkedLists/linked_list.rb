class Node
	attr_accessor :node, :next_node
	def initialize(node)
		@node = node
		@next_node = nil
	end
end

class LinkedList
	def initialize
		@head = nil
		@tail = nil

		@last_node = nil
		@node_size = 0
	end

	def append(val)		
		new_node = Node.new(val)
		@node_size += 1
		
		if @head.nil?     #if there are no nodes yet
			@head = @tail = new_node
			@last_node = new_node
		else
			@last_node.next_node = @tail = new_node
			@last_node = new_node
		end
	end

	def prepend(val)
		@node_size += 1
		new_node = Node.new(val)

		if @head.nil? && @tail.nil?
			@last_node = @head = @tail = new_node			 
		else
			new_node.next_node = @head  #old head will now be next_node
			@head = new_node          #new head will now be new_node
		end
	end

	def node_size
		return @node_size
	end

	def head
		return @head
	end

	def tail
		return @tail
	end

	def to_s
		msg = ""
		node = @head
		cntr = 0
		while cntr != @node_size	
			msg << "#{node.node} -> "
			node = node.next_node
			cntr += 1
		end
		msg << "nil"
		puts msg
	end

	def at(index)		
		if index >= @node_size || index < 0
			puts "INCORRECT INDEX USAGE, PLEASE USE CORRECT INDEX"
		else
			cntr = 0
			node = @head

			while cntr != index
				node = node.next_node
				cntr += 1
			end
			return node
		end
	end

	def pop
		@last_node = node = at(@node_size - 2)  		 
		@node_size -= 1
		node.next_node = nil		 
	end

	def contains?(val)
		cntr = 0
		node = @head
		while cntr != @node_size 
			return true if node.node == val
			node = node.next_node			
			cntr += 1			
		end
	return false
    end

    def find(val)
    	cntr = 0
		node = @head
		while cntr != @node_size 
			return cntr if node.node == val
			node = node.next_node			
			cntr += 1			
		end
	return nil
	end



end


nodes = LinkedList.new

nodes.append('a')
nodes.append('b')
nodes.append('c')
nodes.append('d')

nodes.prepend('g')

#puts nodes.head.node

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

#puts nodes.at(4).node









