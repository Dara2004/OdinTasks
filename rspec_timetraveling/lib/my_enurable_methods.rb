module Enumerable

	def my_each
	    cntr = 0 
		while self.size > cntr
			yield(self[cntr])
			cntr += 1
		end

		return self
	end

	def my_each_with_index
		cntr = 0 
		while self.size > cntr
			yield(self[cntr],cntr)
			cntr += 1
		end

		return self
	end

	def my_select
		arr = Array.new
		self.my_each{|elem| arr.push(elem) if yield(elem) }
		return arr
	end

	def my_all? 
		self.my_select{|elem| yield(elem)} == self ? true : false
	end

	def my_any?
		self.my_select{|elem| yield(elem)}.size > 0 ? true : false
	end

	def my_none?
		!my_any? {|element| yield (element) }
	end

	def my_count(acc = nil)
		if acc != nil
			return self.my_select {|elem| elem == acc}.size
		end

		if block_given?
			return self.my_select {|elem| yield(elem)}.size
		else
			return my_count.size
		end
	end

	def my_map(&block)
		arr = Array.new
		if block_given?
			self.my_each do |elem|
				arr << yield(element)
			end
		else
			self.my_each do |elem|
				arr << element.block.call
			end
		end
	end

	def my_inject(memo = nil)
		if memo.nil?
			memo = self[0]
			i = 1
		else
			i = 0
		end

		while i < self.size
			memo = yield(memo,self[i])
			i += 1
		end
		return memo
	end

	def multiply_els(array)
	    array.my_inject { |memo, element| memo * element }
    end

end

