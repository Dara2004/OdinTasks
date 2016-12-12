class Node
	attr_accessor :value, :parent, :left_node, :right_node

	def initialize(value = nil)
		@value = value
	end

end

class BinaryTree

	def initialize 
		@root = nil
	end

	def build_tree(arr)	
	    @root = Node.new(arr[0]) 	 

		arr.each do |element| 
		next if element == 0		
			initialize_node(element) 
		end

	end

	def initialize_node(value ,node = @root)
		#checks if both sides are nil,then makes a node depending on value
		if value < node.value && node.left_node == nil  
			node.left_node = Node.new(value)
			node.left_node.parent = node
		elsif(value > node.value && node.right_node == nil)
			node.right_node = Node.new(value)
			node.right_node.parent = node
		elsif(value < node.value  && node.left_node != nil)
			new_node = node.left_node
			initialize_node(value,new_node)
		elsif(value > node.value && node.right_node != nil)
			new_node = node.right_node
			initialize_node(value,new_node)
		elsif(value == node.value && node.right_node != nil)
			new_node = node.right_node
			initialize_node(value,new_node)
		end
	end


end


gg = BinaryTree.new
gg.build_tree([5,7,1,15,9,2,14,8,7,3])
gg.temp_output_node

